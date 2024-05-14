#!/bin/bash

SHELL_FOLDER=$(cd $(dirname ${BASH_SOURCE[0]});pwd)

VERSION="v2.14.20"

if [ -n "$1" ];then VERSION=$1; fi

FILEURL=https://github.com/laurent22/joplin/releases/download/v${VERSION#v}/Joplin-${VERSION#v}.AppImage
FILENAME=Joplin.AppImage
_main() {
    which sudo >/dev/null && SUDO="sudo"

    cd /tmp \
    && wget -c $FILEURL -O ${FILENAME} \
    && chmod 666 ${FILENAME} \
    && ${SUDO} mkdir -p /opt/joplin \
    && ${SUDO} cp ${FILENAME} /opt/joplin \
    && ${SUDO} chmod +x /opt/joplin/${FILENAME} \
    && ${SUDO} cp ${SHELL_FOLDER}/icon/joplin.png /opt/joplin/joplin.png \
    && ${SUDO} cp ${SHELL_FOLDER}/desktop/joplin.desktop /usr/share/applications/joplinapp.desktop >/dev/null \
    && echo "install ${FILENAME} ${VERSION} success"
}

_main
