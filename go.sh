VERSION="1.19.2"

if [ -n "$1" ];then VERSION=$1;fi

FILEURL="https://dl.google.com/go/go${VERSION}.linux-amd64.tar.gz"
FILENAME=go${VERSION}.linux-amd64.tar.gz

SUDO=''

_init() {
    which sudo && SUDO="sudo"
}

_main() {
    cd /tmp \
    && curl -O -C - $FILEURL \
    && ${SUDO} rm -rf /usr/local/go \
    && ${SUDO} tar -C /usr/local -xzf $FILENAME \
    && echo "export PATH=\$PATH:/usr/local/go/bin\nexport GOPROXY=https://goproxy.cn,direct\nexport GO111MODULE=on" | ${SUDO} tee  /etc/profile.d/go.sh \
    && echo "install go v${VERSION} success
You may need run \`source /etc/profile\`
    "
}

_init
_main
