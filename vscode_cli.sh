#!/usr/bin/env bash

COMMITID=704ed70d4fd1c6bd6342c436f1ede30d1cff4710
FILEURL="https://az764295.vo.msecnd.net/stable/${COMMITID}/vscode_cli_alpine_x64_cli.tar.gz"
FILENAME=`echo $FILEURL|awk -F "/" '{print $NF}'`

_main(){
    which sudo >/dev/null && SUDO="sudo"

    cd /tmp \
    && wget -c $FILEURL \
    && tar -zxvf ${FILENAME} >/dev/null \
    && ${SUDO} mv code /usr/local/bin/vscode-cli \
    && echo "install vscode-cli success" 
}

_main