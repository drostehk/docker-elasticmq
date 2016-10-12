# docker-elasticmq

A docker container for [elasticmq](https://github.com/adamw/elasticmq) which has an SQS interface, helpful for local use by SQS app developers. It can also be found on [Docker Hub](https://hub.docker.com/r/drostehk/elasticmq/).

## Running

Running can be as simple as
```sh
docker run -P drostehk/elasticmq
```
however, to be generally useful, additional arguments or configuration files will need to be provided.

To provide an elasticmq configuration file, mount a volume and tell elasticmq where it is using the `ELASTICMQ_OPTS` environment variable.
```sh
docker run -P -e ELASTICMQ_OPTS="-Dconfig.file=my.conf" -v /docker/host/emq/my.conf:/elasticmq/my.conf:ro  drostehk/elasticmq
```

Passing simple options without a full-blown config file can also be done using `ELASTICMQ_OPTS`

```sh
docker run -p 9999:9324 -e ELASTICMQ_OPTS="-Dnode-address.host=10.2.3.4 -Dnode-address.port=9999" drostehk/elasticmq
```

## Contributions

This repo was originally copied from https://github.com/iJJi/docker-elasticmq (thanks!), but has been modified to auto-build on Docker Hub and to use the latest version of elasticmq.
