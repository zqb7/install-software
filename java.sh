#!/bin/bash

FILEURL="https://github.com/zqhhh/_pkg/releases/download/jdk/jdk-8u231-linux-x64.tar.gz"
FILENAME=jdk-8u231-linux-x64.tar.gz
UNZIPFILENAME=jdk1.8.0_231

_main(){
    which sudo >/dev/null && SUDO="sudo"
    cd /tmp \
    && wget -c $FILEURL \
    && chmod 666 ${FILENAME} \
    && tar zxvf ${FILENAME} \
    && rm -rf /tmp/jdk \
    && mv ${UNZIPFILENAME} jdk \
    && ${SUDO} rm -rf /opt/jdk \
    && ${SUDO} cp -r jdk /opt/jdk \
    && echo """--------------------------------
install ${UNZIPFILENAME} success
you may need set:  export PATH=\$PATH:/opt/jdk/bin
in your ~/.bashrc  or ~ /.zshrc or /etc/zsh/zshenv
--------------------------------
"""
}

_main $@
