# Allow upgrading to minor revision of Java 8.
FROM openjdk:8-jre-alpine
MAINTAINER Bill McCord <bill@droste.hk>

EXPOSE 9324

ENV ELASTICMQ_VERSION=0.13.6 \
    ELASTICMQ_SHA256=77831bd4a43825f208ba6dafd004ca8fac745b81289ac63d7c05e2dae626d9b9

WORKDIR /elasticmq

RUN wget -q -O elasticmq-server-${ELASTICMQ_VERSION}.jar http://s3-eu-west-1.amazonaws.com/softwaremill-public/elasticmq-server-${ELASTICMQ_VERSION}.jar && \
    echo "${ELASTICMQ_SHA256}  elasticmq-server-${ELASTICMQ_VERSION}.jar" | sha256sum -c -

ENV ELASTICMQ_OPTS=""
ENTRYPOINT ["sh", "-c", "java ${ELASTICMQ_OPTS} -jar elasticmq-server-${ELASTICMQ_VERSION}.jar"]
