#!/usr/bin/env bash

SHELL_FOLDER=$(cd $(dirname ${BASH_SOURCE[0]});pwd)

fileUrl="https://download-installer.cdn.mozilla.net/pub/firefox/releases/133.0/linux-x86_64/zh-CN/firefox-133.0.tar.bz2"
fileName="Firefox-latest-x86_64.tar.bz2"

_main() {
    which sudo >/dev/null && SUDO="sudo"

    cd /tmp \
    && wget -c $fileUrl -O $fileName \
    && chmod 666 ${fileName} \
    && ${SUDO} tar -jxvf $fileName -C /opt/ \
    && ${SUDO} cp ${SHELL_FOLDER}/desktop/firefox.desktop /opt/firefox/firefox.desktop \
    && ${SUDO} ln -fs /opt/firefox/firefox.desktop /usr/share/applications/firefox.desktop \
    && ${SUDO} ln -fs /opt/firefox/firefox /usr/local/bin/firefox \
    && echo "install firefox latest success"
}

_main $@
