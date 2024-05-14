#!/bin/bash

SHELL_FOLDER=$(cd $(dirname ${BASH_SOURCE[0]});pwd)

_main() {
    which sudo >/dev/null && SUDO="sudo"

    cd /tmp \
    && wget --max-redirect=4 -c https://dbeaver.io/files/dbeaver-ce-latest-linux.gtk.x86_64.tar.gz \
    && chmod 666 dbeaver-ce-latest-linux.gtk.x86_64.tar.gz \
    && ${SUDO} tar -zxvf dbeaver-ce-latest-linux.gtk.x86_64.tar.gz -C /opt \
    && ${SUDO} cp ${SHELL_FOLDER}/desktop/dbeaver.desktop /usr/share/applications/dbeaver.desktop \
    && echo "install dbeaver latest success"
}

_main