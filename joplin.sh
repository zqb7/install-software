#!/bin/bash

VERSION="v2.11.11"

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
    && ${SUDO} wget -c https://github.com/zqhhh/_pkg/releases/download/desktop.icon/JoplinIcon.svg -O /opt/joplin/JoplinIcon.svg \
    && echo """[Desktop Entry]
Name=Joplin
Exec=/opt/joplin/Joplin.AppImage
Terminal=false
Type=Application
Icon=/opt/joplin/JoplinIcon.svg 
StartupWMClass=Joplin
X-AppImage-Version=${VERSION#v}
MimeType=x-scheme-handler/joplin;
Comment=Joplin for Desktop
Categories=Office;
""" | ${SUDO} tee  /usr/share/applications/joplinapp.desktop >/dev/null \
    && echo "install ${FILENAME} ${VERSION} success"
}

_main
