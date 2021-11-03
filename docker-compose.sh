#!/bin.bash

# see: https://docs.docker.com/compose/install/
VERSION="2.1.0"
if [ -n "$1" ];then VERSION=$1; fi

cd /tmp && wget -c https://github.com/docker/compose/releases/download/${VERSION}/docker-compose-Linux-x86_64 -O docker-compose && \
    chmod +x docker-compose && \
    cp docker-compose /usr/bin/docker-compose && \
    echo "install success"
if [ $? -ne 0 ];then echo "install faild"; fi
