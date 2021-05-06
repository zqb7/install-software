#!/bin/bash

VERSION="1.16.1"

if [ -n "$1" ];then
    VERSION=$1
fi


FILEURL=https://github.com/syncthing/syncthing/releases/download/v${VERSION}/syncthing-linux-amd64-v${VERSION}.tar.gz
FILENAME=syncthing-linux-amd64-v${VERSION}.tar.gz


cd /tmp && wget -c $FILEURL && \
    tar zxvf  ${FILENAME} && \
    cd ${FILENAME/.tar.gz} && \
    cp syncthing /usr/local/bin/syncthing

if [ $? -ne 0 ];then 
    echo "install faild"
    exit 1
else
    echo "install syncthing  ${VERSION} success"
fi