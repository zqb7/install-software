#!/bin/bash

SHELL_FOLDER=$(cd $(dirname ${BASH_SOURCE[0]});pwd)

_main() {
    which sudo >/dev/null && SUDO="sudo"
    
    html=`curl -s https://filezilla-project.org/download.php?platform=linux64`
    fileUrl=`echo $html | grep -o -E  'https://dl[0-9].cdn.filezilla-project.org[^"]*'`
    if test -z "$fileUrl";then
        echo "安装失败:获取下载链接失败"
        exit 1
    fi
    cd /tmp \
    && wget  -c $fileUrl -O FileZilla_x86_64-linux-gnu.tar.xz \
    && chmod 666 FileZilla_x86_64-linux-gnu.tar.xz \
    && xz -dkf FileZilla_x86_64-linux-gnu.tar.xz \
    && ${SUDO} tar xvf FileZilla_x86_64-linux-gnu.tar -C /opt \
    && cd /opt \
    && ls -lh | grep -o "FileZilla[0-9]" \
    && ${SUDO} rm -rf filezilla \
    && ${SUDO} mv `ls -lh | grep -o "FileZilla[0-9]"` filezilla \
    && ${SUDO} cp ${SHELL_FOLDER}/desktop/filezilla.desktoparrow.com /usr/share/applications/filezilla.desktop >/dev/null \
    && echo "install filezilla latest success"
}

_main
