#!/bin/bash

SHELL_FOLDER=$(cd $(dirname ${BASH_SOURCE[0]});pwd)

VERSION="v26.0.4"

if [ -n "$1" ];then VERSION=$1; fi

FILEURL=https://github.com/jgraph/drawio-desktop/releases/download/v${VERSION#v}/drawio-x86_64-${VERSION#v}.AppImage

_main() {
    which sudo >/dev/null && SUDO="sudo"

    cd /tmp \
    && wget -c $FILEURL -O drawio.AppImage \
    && chmod 666 drawio.AppImage \
    && ${SUDO} mkdir -p /opt/drawio \
    && ${SUDO} cp drawio.AppImage /opt/drawio \
    && ${SUDO} chmod +x /opt/drawio/drawio.AppImage \
    && ${SUDO} cp ${SHELL_FOLDER}/desktop/drawio.desktop /usr/share/applications/drawio.desktop >/dev/null \
    && ${SUDO} cp ${SHELL_FOLDER}/icon/drawio.png /opt/drawio/drawio.png \
    && echo "install drawio ${VERSION} success"
}

_main
