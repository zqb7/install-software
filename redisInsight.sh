#!/bin/bash

SHELL_FOLDER=$(cd $(dirname ${BASH_SOURCE[0]});pwd)

FILEURL=https://download.redisinsight.redis.com/latest/RedisInsight-linux-x86_64.AppImage
FILENAME=RedisInsight.AppImage

_main() {
    which sudo >/dev/null && SUDO="sudo"

    cd /tmp \
    && wget -c $FILEURL -O ${FILENAME} \
    && chmod 666 ${FILENAME} \
    && ${SUDO} mkdir -p /opt/redisInsight \
    && ${SUDO} cp ${FILENAME} /opt/redisInsight \
    && ${SUDO} chmod +x /opt/redisInsight/${FILENAME} \
    && ${SUDO} cp ${SHELL_FOLDER}/icon/RedisInsight.png  /opt/redisInsight/RedisInsight.png \
    && ${SUDO} cp ${SHELL_FOLDER}/desktop/redisInsight.desktop /usr/share/applications/redisInsight.desktop \
    && echo "install ${FILENAME} success"
}

_main
