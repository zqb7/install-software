#!/bin/bash

VERSION="v1.62.2"

if [ -n "$1" ];then
    VERSION=$1
fi


FILEURL=https://github.com/rclone/rclone/releases/download/${VERSION}/rclone-${VERSION}-linux-amd64.zip
FILENAME=rclone-${VERSION}-linux-amd64.zip


_main() {
    cd /tmp \
    && wget -c $FILEURL \
    && unzip -nq  ${FILENAME} \
    && cd ${FILENAME/.zip} \
    && ${SUDO} cp rclone /usr/local/bin/rclone \
    && echo "install rclone  ${VERSION} success"
}

_main