#!/bin/bash

FILEURL=https://download.redisinsight.redis.com/latest/RedisInsight-v2-linux-x86_64.AppImage
FILENAME=RedisInsight.AppImage

_main() {
    which sudo >/dev/null && SUDO="sudo"

    cd /tmp \
    && wget -c $FILEURL -O ${FILENAME} \
    && wget -c https://github.com/zqhhh/_pkg/releases/download/desktop.icon/RedisInsight.png \
    && chmod 666 ${FILENAME} \
    && ${SUDO} mkdir -p /opt/redisInsight \
    && ${SUDO} cp ${FILENAME} /opt/redisInsight \
    && ${SUDO} chmod +x /opt/redisInsight/${FILENAME} \
    && ${SUDO} cp RedisInsight.png  /opt/redisInsight/RedisInsight.png \
    && echo """[Desktop Entry]
Name=RedisInsight
Exec=/opt/redisInsight/RedisInsight.AppImage --no-sandbox
Terminal=false
Type=Application
Icon=/opt/redisInsight/RedisInsight.png
StartupWMClass=RedisInsight-v2
Comment=RedisInsight
Categories=Development;
""" | ${SUDO} tee  /usr/share/applications/RedisInsight.desktop >/dev/null \
    && echo "install ${FILENAME} success"
}

_main
