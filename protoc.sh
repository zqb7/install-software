#!/bin/bash

VERSION="v25.0"

if [ -n "$1" ];then
    VERSION=$1
fi

which sudo >/dev/null && SUDO="sudo"

_install_v_3_0_0() {
    FILENAME=protoc-${VERSION#v}-linux-x86_64.zip
    FILEURL=https://github.com/protocolbuffers/protobuf/releases/download/v${VERSION#v}/${FILENAME#v}
    cd /tmp \
    && wget -c ${FILEURL} \
    && chmod 666 ${FILENAME} \
    && unzip -o ${FILENAME} -d protoc-${VERSION} \
    && ${SUDO} cp protoc-${VERSION}/bin/protoc /usr/local/bin/protoc \
    && echo "install protoc ${VERSION} success"
}

_install_old() {
    FILENAME=protobuf-${VERSION#v}.tar.gz
    FILEURL=https://github.com/protocolbuffers/protobuf/releases/download/v${VERSION#v}/${FILENAME#v}
    cd /tmp \
    && wget -c ${FILEURL} \
    && chmod 666 ${FILENAME} \
    && tar zxvf  ${FILENAME} \
    && cd protobuf-${VERSION#v} \
    && ${SUDO} ./configure \
    && ${SUDO} make install \
    && ${SUDO} ldconfig \
    && echo "install protoc ${VERSION} success"
}
# if run protoc is error 
# ex: protoc: error while loading shared libraries: libprotoc.so.18: cannot open shared object file: No such file or directory
# run `ldconfig`

if [[ "$(echo -e "${VERSION#v}\n3.0.0" | sort -V | head -n2)" == "${VERSION#v}" ]]; then
    _install_v_3_0_0
else
    _install_old
fi
