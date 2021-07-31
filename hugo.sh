#!/bin/bash

VERSION="0.86.1"

if [ -n "$1" ];then
    VERSION=$1
fi


FILEURL=https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_${VERSION}_Linux-64bit.tar.gz
FILENAME=hugo_${VERSION}_Linux-64bit.tar.gz


cd /tmp && wget -c $FILEURL && \
    tar -zxvf ${FILENAME} && \
    cp hugo /usr/local/bin/hugo
    
if [ $? -ne 0 ];then 
    echo "install faild"
    exit 1
else
    echo "install hugo  ${VERSION} success"
fi