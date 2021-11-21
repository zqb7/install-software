#!/bin/bash

VERSION="v3.19.1"

if [ -n "$1" ];then
    VERSION=$1
fi

FILENAME=protobuf-all-${VERSION#v}.tar.gz
FILEURL=https://github.com/protocolbuffers/protobuf/releases/download/${VERSION}/${FILENAME}

_main() {
    which sudo >/dev/null && SUDO="sudo"

    cd /tmp \
    && wget -c ${FILEURL} \
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