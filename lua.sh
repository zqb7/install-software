#!/bin/bash

VERSION="v5.4.4"

if [ -n "$1" ];then
    VERSION=$1
fi


FILEURL=http://www.lua.org/ftp/lua-${VERSION#v}.tar.gz
FILENAME=lua-${VERSION#v}.tar.gz

_main(){
    cd /tmp \
    && wget -c $FILEURL \
    && tar -zxvf ${FILENAME} \
    && ${SUDO} make all test \
    && ${SUDO} make install \
    && ${SUDO} echo "install lua  ${VERSION} success" 
}

_main