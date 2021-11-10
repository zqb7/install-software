#!/bin/bash

# auto install nodejs

VERSION="17.1.0"

if [ -n "$1" ];then
    VERSION=$1
fi


FILEURL="https://nodejs.org/dist/v${VERSION}/node-v${VERSION}-linux-x64.tar.xz"
FILENAME=node-v${VERSION}-linux-x64.tar.xz

cd /tmp && wget -c $FILEURL  && \
    tar --no-same-owner -xvf $FILENAME -C /opt/ && \
    rm -rf /opt/node && \
    mv /opt/${FILENAME/.tar.xz} /opt/node
    
if [ $? -ne 0 ];then 
    echo "install faild"
    exit 1
fi

ln -s /opt/node/bin/node /usr/local/bin/node
ln -s /opt/node/bin/npm /usr/local/bin/npm
ln -s /opt/node/bin/npx /usr/bin/npx

echo "install nodejs success!"
