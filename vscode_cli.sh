#!/usr/bin/env bash

COMMITID=1a5daa3a0231a0fbba4f14db7ec463cf99d7768e
FILEURL="https://az764295.vo.msecnd.net/stable/${COMMITID}/vscode_cli_alpine_x64_cli.tar.gz"
FILENAME=`echo $FILEURL|awk -F "/" '{print $NF}'`

_main(){
    which sudo >/dev/null && SUDO="sudo"

    cd /tmp \
    && wget -c $FILEURL \
    && chmod 666 ${FILENAME} \
    && tar -zxvf ${FILENAME} >/dev/null \
    && ${SUDO} mv code /usr/local/bin/vscode-cli \
    && echo "install vscode-cli success" 
}

_main
