#!/bin/bash

echo $SUDO_USER

VERSION="3.9.0"

if [ -n "$1" ];then VERSION=$1; fi

FILEURL="https://github.com/cdr/code-server/releases/download/v${VERSION}/code-server-${VERSION}-linux-amd64.tar.gz"
FILENAME=code-server-${VERSION}-linux-amd64.tar.gz

cd /tmp && wget -c ${FILEURL} && \
    tar zxvf  ${FILENAME} && \
    rm -rf /tmp/code-server && \
    mv ${FILENAME/.tar.gz} code-server && \
    rm -rf /opt/code-server && \
    cp -r code-server /opt/code-server && \
    cat << EOF > /usr/bin/code-server
#!/bin/bash
#!/usr/bin/env sh

exec /opt/code-server/bin/code-server "$@"
EOF

chmod +x /usr/bin/code-server

if [ $? -ne 0 ];then 
    echo "install faild"
    exit 1
else
    echo "install code-server  ${VERSION} success"
fi