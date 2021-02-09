#!/bin/bash

VERSION="1.15.6"

if [ -n "$1" ];then
    VERSION=$1
fi

FILEURL="https://dl.google.com/go/go${VERSION}.linux-amd64.tar.gz"
FILENAME=go${VERSION}.linux-amd64.tar.gz

cd /tmp && \ 
    wget -c $FILEURL && \
    rm -rf /usr/local/go && \
    tar -C /usr/local -xzf $FILENAME

if [ $? -ne 0 ];then 
    echo "install faild"
    exit 1
fi

cat /etc/bash.bashrc|grep -q ":/usr/local/go/bin" || echo "export PATH=\$PATH:/usr/local/go/bin" >>/etc/bash.bashrc
/usr/local/go/bin/go env -w  GOPROXY=https://goproxy.io,direct
/usr/local/go/bin/go env -w GO111MODULE=on
echo "install go success!"
