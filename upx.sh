#!/bin/bash

VERSION="v4.0.2"

if [ -n "$1" ];then
    VERSION=$1
fi


FILEURL=https://github.com/upx/upx/releases/download/v${VERSION#v}/upx-${VERSION#v}-amd64_linux.tar.xz
FILENAME=upx-${VERSION#v}-amd64_linux.tar.xz

_main(){
    cd /tmp \
    && wget -c $FILEURL \
    && tar -xvf ${FILENAME} \
    && ${SUDO} cp upx-${VERSION#v}-amd64_linux/upx /usr/local/bin/upx \
    && echo "install upx  ${VERSION} success" 
}

_main