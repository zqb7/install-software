#!/bin/bash

VERSION="1.56.1"

if [ -n "$1" ];then
    VERSION=$1
fi


FILEURL=https://github.com/rclone/rclone/releases/download/v${VERSION}/rclone-v${VERSION}-linux-amd64.zip
FILENAME=rclone-v${VERSION}-linux-amd64.zip


cd /tmp && wget -c $FILEURL && \
    unzip -nq  ${FILENAME} && \
    cd ${FILENAME/.zip} && \
    cp rclone /usr/local/bin/rclone

if [ $? -ne 0 ];then 
    echo "install faild"
    exit 1
else
    echo "install rclone  ${VERSION} success"
fi