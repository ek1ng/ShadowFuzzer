FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive 

COPY . /ShadowFuzzer

WORKDIR /ShadowFuzzer

RUN sed -i "s@http://deb.debian.org@http://mirrors.aliyun.com@g" /etc/apt/sources.list && \
    sed -i s/security.ubuntu.com/mirrors.aliyun.com/g /etc/apt/sources.list && \
    apt-get clean && \
    apt-get update && \
    apt-get install -y sqlite3 python3 python3-pip cmake openssl libssl-dev libsqlite3-dev vim mosquitto mosquitto-clients&& \
    pip3 install paho-mqtt && \
    mkdir /ShadowFuzzer/Fuzzer/data && \
    mkdir /ShadowFuzzer/Fuzzer/data/test