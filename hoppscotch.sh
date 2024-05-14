#!/bin/bash
SHELL_FOLDER=$(cd $(dirname ${BASH_SOURCE[0]});pwd)

FILEURL="https://github.com/hoppscotch/releases/releases/latest/download/Hoppscotch_linux_x64.AppImage"
FILENAME=Hoppscotch_linux_x64.AppImage
_main() {
    which sudo >/dev/null && SUDO="sudo"

    cd /tmp \
    && wget -c $FILEURL -O ${FILENAME} \
    && chmod 666 ${FILENAME} \
    && ${SUDO} mkdir -p /opt/hoppscotch \
    && ${SUDO} cp ${FILENAME} /opt/hoppscotch \
    && ${SUDO} chmod +x /opt/hoppscotch/${FILENAME} \
    && ${SUDO} cp ${SHELL_FOLDER}/icon/hoppscotch.png /opt/hoppscotch/hoppscotch.png  \
    && ${SUDO} cp ${SHELL_FOLDER}/desktop/hoppscotch.desktop /usr/share/applications/hoppscotch.desktop >/dev/null \
    && echo "install hoppscotch success"
}

_main
