VERSION="1.17.7"

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
    && echo "export PATH=\$PATH:/usr/local/go/bin\nGOPROXY=https://goproxy.cn,direct\nGO111MODULE=on" | ${SUDO} tee  /etc/profile.d/go.sh \
    && echo "install go v${VERSION} success
You may need run \`source /etc/profile\`
    "
}

_init
_main
