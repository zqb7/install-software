#!/usr/bin/bash
VERSION="v3.5.17"

if [ -n "$1" ];then
    VERSION=$1
fi

GOOGLE_URL=https://storage.googleapis.com/etcd
DOWNLOAD_URL=${GOOGLE_URL}

SUDO=''

_init() {
    which sudo && SUDO="sudo"
}

_main() {
    cd /tmp \
    && wget -c ${DOWNLOAD_URL}/v${VERSION#v}/etcd-v${VERSION#v}-linux-amd64.tar.gz \
    && chmod 666 etcd-v${VERSION#v}-linux-amd64.tar.gz \
    && ${SUDO} rm -rf /opt/etcd \
    && ${SUDO} mkdir -p /opt/etcd \
    && ${SUDO} tar xzvf etcd-v${VERSION#v}-linux-amd64.tar.gz -C /opt/etcd --strip-components=1 \
    && ${SUDO} ln -sf /opt/etcd/etcdctl /usr/local/bin/etcdctl \
    && ${SUDO} ln -sf /opt/etcd/etcd /usr/local/bin/etcd \
    && ${SUDO} ln -sf /opt/etcd/etcdutl /usr/local/bin/etcdutl \
    && echo "install etcd v${VERSION#v} success"
}

_init
_main
