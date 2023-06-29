#!/bin/bash


_main() {
    which sudo >/dev/null && SUDO="sudo"
    
    html=`curl -s https://filezilla-project.org/download.php?platform=linux64`
    fileUrl=`echo $html | grep -o -E  'https://dl[0-9].cdn.filezilla-project.org[^"]*'`
    if test -z "$fileUrl";then
        echo "安装失败:获取下载链接失败"
        exit 1
    fi
    cd /tmp \
    && wget  -c $fileUrl -O FileZilla_x86_64-linux-gnu.tar.xz \
    && chmod 666 FileZilla_x86_64-linux-gnu.tar.xz \
    && xz FileZilla_x86_64-linux-gnu.tar.xz \
    && ${SUDO} tar xvf FileZilla_x86_64-linux-gnu.tar -C /opt \
    && cd /opt \
    && ls -lh | grep -o "FileZilla[0-9]" \
    && ${SUDO} rm -rf filezilla \
    && mv `ls -lh | grep -o "FileZilla[0-9]"` filezilla \
    && echo """[Desktop Entry]
Name=FileZilla
GenericName=FTP client
GenericName[da]=FTP-klient
GenericName[de]=FTP-Client
GenericName[fr]=Client FTP
Comment=Download and upload files via FTP, FTPS and SFTP
Comment[da]=Download og upload filer via FTP, FTPS og SFTP
Comment[de]=Dateien über FTP, FTPS und SFTP übertragen
Comment[fr]=Transférer des fichiers via FTP, FTPS et SFTP
Exec=/opt/filezilla/bin/filezilla
Terminal=false
Icon=/opt/filezilla/share/pixmaps/filezilla.png
Type=Application
Categories=Network;FileTransfer;
Version=1.0
""" | ${SUDO} tee /usr/share/applications/filezilla.desktop >/dev/null \
    && echo "install filezilla latest success"
}

_main
