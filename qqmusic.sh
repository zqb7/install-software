#!/bin/bash

SHELL_FOLDER=$(cd $(dirname ${BASH_SOURCE[0]});pwd)

FILEURL="https://dldir1.qq.com/music/clntupate/linux/AppImage/qqmusic-1.1.5.AppImage"
FILENAME=qqmusic.AppImage
_main() {
    which sudo >/dev/null && SUDO="sudo"

    cd /tmp \
    && wget -c $FILEURL -O ${FILENAME} \
    && chmod 666 ${FILENAME} \
    && ${SUDO} mkdir -p /opt/qqmusic \
    && ${SUDO} cp ${FILENAME} /opt/qqmusic \
    && ${SUDO} chmod +x /opt/qqmusic/${FILENAME} \
    && ${SUDO} cp ${SHELL_FOLDER}/icon/qqmusic.png /opt/qqmusic/qqmusic.png  \
    && ${SUDO} cp ${SHELL_FOLDER}/desktop/qqmusic.desktop /usr/share/applications/qqmusic.desktop \
    && echo "install qqmusic success"
}

_main
