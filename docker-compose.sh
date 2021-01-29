#!/bin.bash

# see: https://docs.docker.com/compose/install/


pushd /tmp >/dev/null
wget -c https://github.com/docker/compose/releases/download/1.28.0/docker-compose-Linux-x86_64 -O docker-compose && \
    chmod +x docker-compose && \
    cp docker-compose /usr/bin/docker-compose && \
    echo "install success"
if [ $? -ne 0 ];then 
    echo "install faild"
fi
popd
