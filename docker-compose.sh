#!/bin/bash

# see: https://docs.docker.com/compose/install/
VERSION="v2.17.3"
if [ -n "$1" ];then VERSION=$1; fi

_main() {
    which sudo >/dev/null && SUDO="sudo"

    cd /tmp \
    && wget -c https://github.com/docker/compose/releases/download/${VERSION}/docker-compose-Linux-x86_64 -O docker-compose \
    && chmod +x docker-compose \
    && ${SUDO} cp docker-compose /usr/local/bin/docker-compose \
    && echo "install docker-compose ${VERSION} success"
}

_main