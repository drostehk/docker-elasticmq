# Allow upgrading to minor revision of Java 8.
FROM openjdk:8-jre-alpine
MAINTAINER Bill McCord <bill@droste.hk>

EXPOSE 9324

ENV ELASTICMQ_VERSION=0.12.0 \
    ELASTICMQ_SHA256=06c6b5dcf0d2f7efdbbeca466917a0345bc71fbccaf1282e74b14e596cd2b215

WORKDIR /elasticmq

RUN wget -q -O elasticmq-server-${ELASTICMQ_VERSION}.jar http://s3-eu-west-1.amazonaws.com/softwaremill-public/elasticmq-server-${ELASTICMQ_VERSION}.jar && \
    echo "${ELASTICMQ_SHA256}  elasticmq-server-${ELASTICMQ_VERSION}.jar" | sha256sum -c -

ENV ELASTICMQ_OPTS=""
ENTRYPOINT ["sh", "-c", "java ${ELASTICMQ_OPTS} -jar elasticmq-server-${ELASTICMQ_VERSION}.jar"]
