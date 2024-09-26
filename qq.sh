#!/bin/bash

SHELL_FOLDER=$(cd $(dirname ${BASH_SOURCE[0]});pwd)

FILEURL="https://dldir1.qq.com/qqfile/qq/QQNT/Linux/QQ_3.2.9_240606_amd64_01.deb","rpm":"https://dldir1.qq.com/qqfile/qq/QQNT/Linux/QQ_3.2.9_240606_x86_64_01.rpm","appimage":"https://dldir1.qq.com/qqfile/qq/QQNT/Linux/QQ_3.2.9_240606_x86_64_01.AppImage"},"armDownloadUrl":{"deb":"https://dldir1.qq.com/qqfile/qq/QQNT/Linux/QQ_3.2.9_240606_arm64_01.deb","rpm":"https://dldir1.qq.com/qqfile/qq/QQNT/Linux/QQ_3.2.9_240606_aarch64_01.rpm","appimage":"https://dldir1.qq.com/qqfile/qq/QQNT/Linux/QQ_3.2.9_240606_arm64_01.AppImage"},"loongarchDownloadUrl":{"deb":"https://dldir1.qq.com/qqfile/qq/QQNT/Linux/QQ_3.2.9_240606_loongarch64_01.deb"},"mipsDownloadUrl":{"deb":"https://dldir1.qq.com/qqfile/qq/QQNT/Linux/QQ_3.2.9_240606_mips64el_01.deb"}};"
FILENAME=qq.AppImage
_main() {
    which sudo >/dev/null && SUDO="sudo"

    cd /tmp \
    && wget -c $FILEURL -O ${FILENAME} \
    && chmod 666 ${FILENAME} \
    && ${SUDO} mkdir -p /opt/qq \
    && ${SUDO} cp ${FILENAME} /opt/qq \
    && ${SUDO} chmod +x /opt/qq/${FILENAME} \
    && ${SUDO} cp ${SHELL_FOLDER}/icon/qq.png /opt/qq/qq.png  \
    && ${SUDO} cp ${SHELL_FOLDER}/desktop/qq.desktop /usr/share/applications/qq.desktop \
    && echo "install qq success"
}

_main
