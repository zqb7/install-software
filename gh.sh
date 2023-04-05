#!/bin/bash
VERSION="v2.26.1"

if [ -n "$1" ];then
    VERSION=$1
fi


FILEURL=https://github.com/cli/cli/releases/download/v${VERSION#v}/gh_${VERSION#v}_linux_amd64.tar.gz
FILENAME=gh_${VERSION#v}_linux_amd64.tar.gz

_main(){
    cd /tmp \
    && wget -c $FILEURL \
    && tar -zxvf ${FILENAME} \
    && ${SUDO} cp gh_${VERSION#v}_linux_amd64/bin/gh  /usr/local/bin/gh \
    && echo "install gh  ${VERSION} success" 
}

_main