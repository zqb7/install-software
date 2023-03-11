#!/bin/bash

VERSION="v22.2"

if [ -n "$1" ];then
    VERSION=$1
fi

FILENAME=protobuf-all-${VERSION#v}.tar.gz
FILEURL=https://github.com/protocolbuffers/protobuf/releases/download/v${VERSION#v}/${FILENAME#v}

_main() {
    which sudo >/dev/null && SUDO="sudo"

    http_code=`curl -s -o /dev/null -I -w "%{http_code}" ${FILEURL}`
    if [ $http_code -eq 404 ];then
        FILENAME=protobuf-${VERSION#v}.tar.gz
        FILEURL=https://github.com/protocolbuffers/protobuf/releases/download/v${VERSION#v}/${FILENAME#v}
    elif [ $http_code -ne 200 ] && [ $http_code -ne 301 ] && [ $http_code -ne 302 ];then
        echo "http ${http_code}"
        exit 1
    fi
    cd /tmp \
    && curl -OL -C - ${FILEURL} \
    && tar zxvf  ${FILENAME} \
    && cd protobuf-${VERSION#v} \
    && ${SUDO} ./configure \
    && ${SUDO} make install \
    && ${SUDO} ldconfig \
    && echo "install protoc ${VERSION} success"
}
# if run protoc is error 
# ex: protoc: error while loading shared libraries: libprotoc.so.18: cannot open shared object file: No such file or directory
# run `ldconfig`

_main
