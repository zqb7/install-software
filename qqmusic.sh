#!/bin/bash

FILEURL="https://dldir1.qq.com/music/clntupate/linux/AppImage/qqmusic-1.1.5.AppImage"
FILENAME=qqmusic.AppImage
_main() {
    which sudo >/dev/null && SUDO="sudo"

    cd /tmp \
    && wget -c $FILEURL -O ${FILENAME} \
    && wget -c https://github.com/qilook/storage/releases/download/desktop.icon/qqmusic.png \
    && chmod 666 ${FILENAME} \
    && ${SUDO} mkdir -p /opt/qqmusic \
    && ${SUDO} cp ${FILENAME} /opt/qqmusic \
    && ${SUDO} chmod +x /opt/qqmusic/${FILENAME} \
    && ${SUDO} cp qqmusic.png /opt/qqmusic/qqmusic.png  \
    && echo """[Desktop Entry]
Name=qqmusic
Exec=/opt/qqmusic/qqmusic.AppImage --no-sandbox %U
Terminal=false
Type=Application
Icon=/opt/qqmusic/qqmusic.png
StartupWMClass=qqmusic
Comment=Tencent QQMusic
Categories=AudioVideo;
""" | ${SUDO} tee  /usr/share/applications/qqmusic.desktop >/dev/null \
    && echo "install qqmusic success"
}

_main
