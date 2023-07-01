#!/bin/bash

VERSION="v1.6.1"

if [ -n "$1" ];then VERSION=$1; fi

FILEURL=https://github.com/qishibo/AnotherRedisDesktopManager/releases/download/v${VERSION#v}/Another-Redis-Desktop-Manager.${VERSION#v}.AppImage
FILENAME=Another-Redis-Desktop-Manager.AppImage
_main() {
    which sudo >/dev/null && SUDO="sudo"

    cd /tmp \
    && wget -c $FILEURL -O ${FILENAME} \
    && wget -c https://github.com/zqhhh/_pkg/releases/download/desktop.icon/another-redis-desktop-manager.png \
    && chmod 666 ${FILENAME} \
    && ${SUDO} mkdir -p /opt/anotherRedisDesktopManager \
    && ${SUDO} cp ${FILENAME} /opt/anotherRedisDesktopManager \
    && ${SUDO} chmod +x /opt/anotherRedisDesktopManager/${FILENAME} \
    && ${SUDO} cp another-redis-desktop-manager.png /opt/anotherRedisDesktopManager/another-redis-desktop-manager.png  \
    && echo """[Desktop Entry]
Name=Another Redis Desktop Manager
Exec=/opt/anotherRedisDesktopManager/Another-Redis-Desktop-Manager.AppImage --no-sandbox
Terminal=false
Type=Application
Icon=/opt/anotherRedisDesktopManager/another-redis-desktop-manager.png 
StartupWMClass=Another Redis Desktop Manager
X-AppImage-Version=${VERSION#v}
Comment=A faster, better and more stable redis desktop manager.
Categories=Utility;
""" | ${SUDO} tee  /usr/share/applications/another-redis-desktop-manager.desktop >/dev/null \
    && echo "install ${FILENAME} ${VERSION} success"
}

_main
