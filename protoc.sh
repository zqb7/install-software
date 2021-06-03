#!/bin/bash

VERSION="3.17.2"

if [ -n "$1" ];then
    VERSION=$1
fi

FILENAME=protobuf-all-${VERSION}.tar.gz
FILEURL=https://github.com/protocolbuffers/protobuf/releases/download/v${VERSION}/${FILENAME}
cd /tmp && wget -c ${FILEURL} && \
    tar zxvf  ${FILENAME} && \
    cd protobuf-${VERSION} && \
    ./configure && \
    make install && \
    ldconfig

if [ $? -ne 0 ];then 
    echo "install faild"
    exit 1 
fi
echo "install protoc success!"

# if run protoc is error 
# ex: protoc: error while loading shared libraries: libprotoc.so.18: cannot open shared object file: No such file or directory
# run `ldconfig`