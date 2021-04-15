#!/bin/bash

html=`curl -s https://filezilla-project.org/download.php?platform=linux64`
fileUrl=`echo $html | grep -o -E  'https://dl[0-9].cdn.filezilla-project.org[^"]*'`
echo $fileUrl
if test -z "$fileUrl";then
    echo "安装失败:获取下载链接失败"
    exit 1
else
    wget  -c $fileUrl -O FileZilla_x86_64-linux-gnu.tar.bz2 && \
    tar jxvf FileZilla_x86_64-linux-gnu.tar.bz2 -C /opt && \
    cd /opt && ls -lh | grep -o "FileZilla[0-9]"  && \
    rm -rf filezilla && \
    mv `ls -lh | grep -o "FileZilla[0-9]"` filezilla
fi

if [ $? -ne 0 ];then 
    echo "install faild"
    exit 1
fi

cat <<EOF >/usr/share/applications/filezilla.desktop
[Desktop Entry]
Name=FileZilla
GenericName=FTP client
GenericName[da]=FTP-klient
GenericName[de]=FTP-Client
GenericName[fr]=Client FTP
Comment=Download and upload files via FTP, FTPS and SFTP
Comment[da]=Download og upload filer via FTP, FTPS og SFTP
Comment[de]=Dateien über FTP, FTPS und SFTP übertragen
Comment[fr]=Transférer des fichiers via FTP, FTPS et SFTP
Exec=/opt/filezilla/filezilla
Terminal=false
Icon=/opt/filezilla/share/pixmaps/filezilla.png
Type=Application
Categories=Network;FileTransfer;
Version=1.0
EOF

echo "install success"