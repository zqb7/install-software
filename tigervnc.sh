#!/bin/bash

fileUrl="http://tigervnc.bphinz.com/nightly/xc/x86_64/tigervnc-1.13.80-20230605git57cdcedf.x86_64.tar.gz"
fileName="tigervnc-1.13.80-20230605git57cdcedf.x86_64.tar.gz"

export HOME=${HOME}

_main() {
  which sudo >/dev/null && SUDO="sudo"

  cd /tmp \
  && wget --max-redirect=2 -c $fileUrl -O $fileName \
  && chmod 666 $fileName \
  && tar zxvf $fileName \
  && mv ${fileName%.tar.gz} tigervnc \
  && ${SUDO} rm -rf /opt/tigervnc \
  && ${SUDO} mv tigervnc /opt/tigervnc \
  && echo """download tigervnc success
see "http://sadeye.cn/post/linux配置tigervnc" and deploy
"""
  if [ $? -ne 0 ];then
    echo "install failed"
    exit 1
  fi

  if [ "$1" == "auto" ];then
    echo """-----------------------------
auto deploy by systemd
-----------------------------
"""
      mkdir -p ~/.vnc \
      && touch ${HOME}/.vnc/passwd \
      && [ -f "${HOME}/.vnc/passwd" ] \
      || echo "please set vnc passwd" \
      && /opt/tigervnc/usr/bin/vncpasswd
      chmod 777 ~/.vnc/passwd \
      && echo """[Unit]
Description=tigerVNC services

[Service]
Type=forking
User=$(whoami)
Environment="DISPLAY=:0"
Restart=on-failure
RestartSec=5s
ExecStart=/opt/tigervnc/usr/bin/x0vncserver SecurityTypes=VncAuth PasswordFile=${HOME}/.vnc/passwd

[Install]
WantedBy=default.target
""" | ${SUDO} tee /lib/systemd/system/tigervnc.service >/dev/null \
      && ${SUDO} systemctl daemon-reload \
      && ${SUDO} systemctl enable tigervnc \
      && ${SUDO} systemctl status tigervnc
  fi
}
_main $@