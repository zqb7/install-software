#!/bin/bash

VERSION="v5.4.7"

if [ -n "$1" ];then
    VERSION=$1
fi

SUDO=''

_init() {
    which sudo && SUDO="sudo"
}

FILEURL=http://www.lua.org/ftp/lua-${VERSION#v}.tar.gz
FILENAME=lua-${VERSION#v}.tar.gz

_main(){
    cd /tmp \
    && wget -c $FILEURL \
    && chmod 666 ${FILENAME} \
    && tar -zxvf ${FILENAME} \
    && cd lua-${VERSION#v} \
    && ${SUDO} make linux \
    && ${SUDO} make install \
    && ${SUDO} echo "install lua  ${VERSION} success" 
}

_init
_main
