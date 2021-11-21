#!/bin/bash


cat << EOF >/dev/stdout
---------------------------------------------------------
注意:默认安装openjdk，如果使用参数: notopen,则会安装官方的jdk,如: $0 notopen
---------------------------------------------------------
EOF
sleep 3s

FILEURL="https://mirrors.tuna.tsinghua.edu.cn/AdoptOpenJDK/15/jdk/x64/linux/OpenJDK15U-jdk_x64_linux_hotspot_15.0.2_7.tar.gz"
FILENAME=OpenJDK15U-jdk_x64_linux_hotspot_15.0.2_7.tar.gz
UNZIPFILENAME=jdk-15.0.2+7

_main(){
    which sudo >/dev/null && SUDO="sudo"

    if [ "$1" == "notopen" ];then
    FILEURL="http://dl.sadeye.cn/java/jdk-8u231-linux-x64.tar.gz"
    FILENAME=jdk-8u231-linux-x64.tar.gz
    UNZIPFILENAME=jdk1.8.0_231
    fi

    cd /tmp \
    && wget -c $FILEURL \
    && tar zxvf ${FILENAME} \
    && rm -rf /tmp/jdk \
    && mv ${UNZIPFILENAME} jdk \
    && ${SUDO} rm -rf /opt/jdk \
    && ${SUDO} cp -r jdk /opt/jdk \
    &&  echo "export PATH=\$PATH:/opt/jdk/bin" | tee /etc/profile.d/java.sh >/dev/null \
    && echo """--------------------------------
install ${UNZIPFILENAME} success
you may need run: source /etc/profile
--------------------------------
"""
}

_main $@