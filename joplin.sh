#!/bin/bash

VERSION="v2.13.13"

if [ -n "$1" ];then VERSION=$1; fi

FILEURL=https://github.com/laurent22/joplin/releases/download/v${VERSION#v}/Joplin-${VERSION#v}.AppImage
FILENAME=Joplin.AppImage
_main() {
    which sudo >/dev/null && SUDO="sudo"

    cd /tmp \
    && wget -c $FILEURL -O ${FILENAME} \
    && wget -c https://github.com/qilook/storage/releases/download/desktop.icon/joplin.png \
    && chmod 666 ${FILENAME} \
    && ${SUDO} mkdir -p /opt/joplin \
    && ${SUDO} cp ${FILENAME} /opt/joplin \
    && ${SUDO} chmod +x /opt/joplin/${FILENAME} \
    && ${SUDO} cp joplin.png /opt/joplin/joplin.png\
    && echo """[Desktop Entry]
Name=Joplin
Exec=/opt/joplin/Joplin.AppImage --no-sandbox
Terminal=false
Type=Application
Icon=/opt/joplin/joplin.png
StartupWMClass=Joplin
X-AppImage-Version=${VERSION#v}
MimeType=x-scheme-handler/joplin;
Comment=Joplin for Desktop
Categories=Office;
""" | ${SUDO} tee  /usr/share/applications/joplinapp.desktop >/dev/null \
    && echo "install ${FILENAME} ${VERSION} success"
}

_main
