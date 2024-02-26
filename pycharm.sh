#!/bin/bash

VERSION="2023.3.4"

if [ -n "$1" ];then VERSION=$1; fi

FILEURL=https://download-cdn.jetbrains.com/python/pycharm-community-${VERSION#v}.tar.gz
FILENAME=pycharm-community-${VERSION#v}.tar.gz
_main() {
    which sudo >/dev/null && SUDO="sudo"

    cd /tmp \
    && wget -c $FILEURL -O ${FILENAME} \
    && chmod 666 ${FILENAME} \
    && tar zxvf pycharm-community-${VERSION#v}.tar.gz \
    && ${SUDO} mkdir -p /opt/pycharm-community \
    && ${SUDO} cp -R pycharm-community-${VERSION#v}/* /opt/pycharm-community/ \
    && echo """[Desktop Entry]
Version=1.0
Type=Application
Name=PyCharm Community Edition
Icon=/opt/pycharm-community/bin/pycharm.svg
Exec="/opt/pycharm-community/bin/pycharm.sh" %f
Comment=Python IDE for Professional Developers
Categories=Development;IDE;
Terminal=false
StartupWMClass=jetbrains-pycharm-ce
StartupNotify=true
""" | ${SUDO} tee  /usr/share/applications/jetbrains-pycharm-ce.desktop >/dev/null \
    && echo "install pycharm-ce ${VERSION} success"
}

_main
