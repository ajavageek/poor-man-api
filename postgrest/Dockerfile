FROM debian:bookworm-slim

ARG POSTGREST_VERSION=v10.1.1
ARG POSTGREST_FILE=postgrest-$POSTGREST_VERSION-linux-static-x64.tar.xz

RUN mkdir postgrest

WORKDIR postgrest

ADD https://github.com/PostgREST/postgrest/releases/download/$POSTGREST_VERSION/$POSTGREST_FILE \
    .

RUN apt-get update && \
    apt-get install -y libpq-dev xz-utils && \
    tar xvf $POSTGREST_FILE && \
    rm $POSTGREST_FILE
