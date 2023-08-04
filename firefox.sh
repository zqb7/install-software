#!/usr/bin/env bash

fileUrl="https://download-installer.cdn.mozilla.net/pub/firefox/releases/116.0.1/linux-x86_64/zh-CN/firefox-116.0.1.tar.bz2"
fileName="Firefox-latest-x86_64.tar.bz2"

_main() {
    which sudo >/dev/null && SUDO="sudo"

    cd /tmp \
    && wget -c $fileUrl -O $fileName \
    && chmod 666 ${fileName} \
    && ${SUDO} tar -jxvf $fileName -C /opt/ \
    && echo """[Desktop Entry]
Version=1.0
Type=Application
Name=firefox
Icon=/opt/firefox/browser/chrome/icons/default/default128.png
Exec="/opt/firefox/firefox"
Comment=firefox;
Categories=Development;tool;
Terminal=false
StartupWMClass=firefox
""" | ${SUDO} tee /opt/firefox/firefox.desktop >/dev/null \
    && ${SUDO} ln -fs /opt/firefox/firefox.desktop /usr/share/applications/firefox.desktop \
    && ${SUDO} ln -fs /opt/firefox/firefox /usr/local/bin/firefox \
    && echo "install firefox latest success"
}

_main $@
