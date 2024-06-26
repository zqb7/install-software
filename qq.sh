#!/bin/bash

SHELL_FOLDER=$(cd $(dirname ${BASH_SOURCE[0]});pwd)

FILEURL="https://dldir1.qq.com/qqfile/qq/QQNT/Linux/QQ_3.2.9_240606_x86_64_01.AppImage"
FILENAME=qq.AppImage
_main() {
    which sudo >/dev/null && SUDO="sudo"

    cd /tmp \
    && wget -c $FILEURL -O ${FILENAME} \
    && chmod 666 ${FILENAME} \
    && ${SUDO} mkdir -p /opt/qq \
    && ${SUDO} cp ${FILENAME} /opt/qq \
    && ${SUDO} chmod +x /opt/qq/${FILENAME} \
    && ${SUDO} cp ${SHELL_FOLDER}/icon/qq.png /opt/qq/qq.png  \
    && ${SUDO} cp ${SHELL_FOLDER}/desktop/qq.desktop /usr/share/applications/qq.desktop \
    && echo "install qq success"
}

_main
