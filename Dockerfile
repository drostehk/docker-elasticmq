# Allow upgrading to minor revision of Java 8.
FROM openjdk:8-jre-alpine
MAINTAINER Bill McCord <bill@droste.hk>

EXPOSE 9324

ENV ELASTICMQ_VERSION=0.13.1 \
    ELASTICMQ_SHA256=ec1851f834c872c9121f48e1f5417a29a064692d7de1075cd0339e0bd2741254

WORKDIR /elasticmq

RUN wget -q -O elasticmq-server-${ELASTICMQ_VERSION}.jar http://s3-eu-west-1.amazonaws.com/softwaremill-public/elasticmq-server-${ELASTICMQ_VERSION}.jar && \
    echo "${ELASTICMQ_SHA256}  elasticmq-server-${ELASTICMQ_VERSION}.jar" | sha256sum -c -

ENV ELASTICMQ_OPTS=""
ENTRYPOINT ["sh", "-c", "java ${ELASTICMQ_OPTS} -jar elasticmq-server-${ELASTICMQ_VERSION}.jar"]
