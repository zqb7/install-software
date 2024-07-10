#!/bin/bash

SHELL_FOLDER=$(cd $(dirname ${BASH_SOURCE[0]});pwd)

VERSION="2024.1.4"

if [ -n "$1" ];then VERSION=$1; fi

FILEURL=https://download-cdn.jetbrains.com/python/pycharm-community-${VERSION#v}.tar.gz
FILENAME=pycharm-community-${VERSION#v}.tar.gz
_main() {
    which sudo >/dev/null && SUDO="sudo"

    cd /tmp \
    && wget -c $FILEURL -O ${FILENAME} \
    && chmod 666 ${FILENAME} \
    && tar zxvf pycharm-community-${VERSION#v}.tar.gz \
    && ${SUDO} mkdir -p /opt/pycharm-community \
    && ${SUDO} cp -R pycharm-community-${VERSION#v}/* /opt/pycharm-community/ \
    && ${SUDO} cp ${SHELL_FOLDER}/desktop/pycharm.desktop /usr/share/applications/jetbrains-pycharm-ce.desktop \
    && echo "install pycharm-ce ${VERSION} success"
}

_main
