VERSION="1.20.4"

if [ -n "$1" ];then VERSION=$1;fi

FILEURL="https://dl.google.com/go/go${VERSION}.linux-amd64.tar.gz"
FILENAME=go${VERSION}.linux-amd64.tar.gz

SUDO=''

_init() {
    which sudo && SUDO="sudo"
}

_main() {
    cd /tmp \
    && wget -c ${FILEURL} \
    && chmod 666 ${FILENAME} \
    && ${SUDO} rm -rf /usr/local/go \
    && ${SUDO} tar -C /usr/local -xzf $FILENAME \
    && ${SUDO} ln -sf /usr/local/go/bin/go /usr/local/bin/go \
    && ${SUDO} ln -sf /usr/local/go/bin/gofmt /usr/local/bin/gofmt \
    && echo "install go v${VERSION} success"
}

_init
_main
