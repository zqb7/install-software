#!/bin/bash

FILEURL="https://github.com/hoppscotch/releases/releases/latest/download/Hoppscotch_linux_x64.AppImage"
FILENAME=Hoppscotch_linux_x64.AppImage
_main() {
    which sudo >/dev/null && SUDO="sudo"

    cd /tmp \
    && wget -c $FILEURL -O ${FILENAME} \
    && wget -c https://github.com/qilook/storage/releases/download/desktop.icon/hoppscotch.png \
    && chmod 666 ${FILENAME} \
    && ${SUDO} mkdir -p /opt/hoppscotch \
    && ${SUDO} cp ${FILENAME} /opt/hoppscotch \
    && ${SUDO} chmod +x /opt/hoppscotch/${FILENAME} \
    && ${SUDO} cp hoppscotch.png /opt/hoppscotch/hoppscotch.png  \
    && echo """[Desktop Entry]
Name=hoppscotch
Exec=/opt/hoppscotch/Hoppscotch_linux_x64.AppImage --no-sandbox %U
Terminal=false
Type=Application
Icon=/opt/hoppscotch/hoppscotch.png
StartupWMClass=hoppscotch
Comment=hoppscotch
Categories=AudioVideo;
""" | ${SUDO} tee  /usr/share/applications/hoppscotch.desktop >/dev/null \
    && echo "install hoppscotch success"
}

_main
