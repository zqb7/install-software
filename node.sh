#!/bin/bash

# auto install nodejs
VERSION="v19.8.1"

if [ -n "$1" ];then
    VERSION=$1
fi


FILEURL="https://nodejs.org/dist/v${VERSION#v}/node-v${VERSION#v}-linux-x64.tar.xz"
FILENAME=node-v${VERSION#v}-linux-x64.tar.xz

_main() {
    which sudo >/dev/null && SUDO="sudo"

    cd /tmp \
    && wget -c $FILEURL \
    && ${SUDO} tar --no-same-owner -xvf $FILENAME -C /opt/ \
    && ${SUDO} rm -rf /opt/node \
    && ${SUDO} mv /opt/${FILENAME%.tar.xz} /opt/node \
    && ${SUDO} ln -fs /opt/node/bin/node /usr/local/bin/node \
    && ${SUDO} ln -fs /opt/node/bin/npm /usr/local/bin/npm \
    && ${SUDO} ln -fs /opt/node/bin/npx /usr/bin/npx \
    && echo "export PATH=\$PATH:/opt/node/bin" | ${SUDO} tee  /etc/profile.d/node.sh \
    && echo "install nodejs v${VERSION#v} success
You may need run \`source /etc/profile\`
    "
}

_main
