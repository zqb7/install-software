#!/bin/bash
VERSION="v0.146.2"

if [ -n "$1" ];then
    VERSION=$1
fi


FILEURL=https://github.com/gohugoio/hugo/releases/download/${VERSION}/hugo_${VERSION#v}_Linux-64bit.tar.gz
FILENAME=hugo_${VERSION#v}_Linux-64bit.tar.gz

_main(){
    cd /tmp \
    && wget -c $FILEURL \
    && chmod 666 ${FILENAME} \
    && tar -zxvf ${FILENAME} \
    && ${SUDO} cp hugo /usr/local/bin/hugo \
    && echo "install hugo  ${VERSION} success" 
}

_main