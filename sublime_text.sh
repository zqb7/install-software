#!/usr/bin/env bash

file_url="https://download.sublimetext.com/sublime_text_build_4166_x64.tar.xz"
file_name=`echo $file_url | awk -F '/' '{print $NF}'`

_main() {
    which sudo >/dev/null && SUDO="sudo"

    cd /tmp \
    && wget -c $file_url \
    && chmod 666 $file_name \
    && ${SUDO} rm -rf /opt/sublime_text \
    && ${SUDO} tar -xvf $file_name -C /opt/ \
    && ${SUDO} rm -f /usr/share/applications/sublime_text.desktop \
    && ${SUDO} ln -fs /opt/sublime_text/sublime_text.desktop /usr/share/applications/sublime_text.desktop \
    && ${SUDO} sed -i 's/^Icon=.*/Icon=\/opt\/sublime_text\/Icon\/48x48\/sublime-text.png/' /opt/sublime_text/sublime_text.desktop \
    && echo """#!/bin/sh
exec /opt/sublime_text/sublime_text --fwdargv0 "$0" "$@"
""" | ${SUDO} tee /usr/local/bin/subl >/dev/null \
    && ${SUDO} chmod +x /usr/local/bin/subl \
    && echo "install sublime_text latest success"
}

_main
