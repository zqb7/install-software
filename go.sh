VERSION="1.19.2"

if [ -n "$1" ];then VERSION=$1;fi

FILEURL="https://dl.google.com/go/go${VERSION}.linux-amd64.tar.gz"
FILENAME=go${VERSION}.linux-amd64.tar.gz

SUDO=''

GOVAR="\n# Go environment variable\nexport PATH=\$PATH:/usr/local/go/bin\nexport GOPROXY=https://goproxy.cn,direct\nexport GO111MODULE=on"

_init() {
    which sudo && SUDO="sudo"
}

_main() {
    cd /tmp \
    && curl -O -C - $FILEURL \
    && ${SUDO} rm -rf /usr/local/go \
    && ${SUDO} tar -C /usr/local -xzf $FILENAME \
    && echo "install go v${VERSION} success"

    if [ -n "`$SHELL -c 'echo $BASH_VERSION'`" ]; then
        echo ${GOVAR} | tee -a ~/.bashrc
        echo "You may need run \`source ~/.bashrc\`"
    elif [ -n "`$SHELL -c 'echo $ZSH_VERSION'`" ]; then
        echo ${GOVAR} | tee -a ~/.zshrc 
        echo "You may need run \`source ~/.zshrc\`"
    else
        echo -e "You may add manually \n${GOVAR}"
    fi
}

_init
_main
