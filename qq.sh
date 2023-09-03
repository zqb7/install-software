#!/bin/bash

FILEURL="https://dldir1.qq.com/qqfile/qq/QQNT/1776936e/linuxqq_3.2.0-16605_x86_64.AppImage"
FILENAME=qq.AppImage
_main() {
    which sudo >/dev/null && SUDO="sudo"

    cd /tmp \
    && wget -c $FILEURL -O ${FILENAME} \
    && wget -c https://github.com/zqhhh/storage/releases/download/desktop.icon/qq.png \
    && chmod 666 ${FILENAME} \
    && ${SUDO} mkdir -p /opt/qq \
    && ${SUDO} cp ${FILENAME} /opt/qq \
    && ${SUDO} chmod +x /opt/qq/${FILENAME} \
    && ${SUDO} cp qq.png /opt/qq/qq.png  \
    && echo """[Desktop Entry]
Name=QQ
Exec=/opt/qq/qq.AppImage --no-sandbox %U
Terminal=false
Type=Application
Icon=/opt/qq/qq.png
StartupWMClass=QQ
Categories=Network;
Comment=QQ
""" | ${SUDO} tee  /usr/share/applications/qq.desktop >/dev/null \
    && echo "install qq success"
}

_main
