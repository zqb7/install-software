#!/bin/bash

fileUrl="http://tigervnc.bphinz.com/nightly/xc/x86_64/tigervnc-1.12.80-20211108git8eee7f36.x86_64.tar.gz"
fileName="tigervnc-1.12.80-20211108git8eee7f36.x86_64.tar.gz"

cd /tmp && \
  wget --max-redirect=2 -c $fileUrl -O $fileName && \
  tar zxvf $fileName  && \
  mv ${fileName%.tar.gz} tigervnc && \
  rm -rf /opt/tigervnc && \
  mv tigervnc /opt/tigervnc

if [ $? -ne 0 ];then
    echo "install failed"
    exit 1
fi

[ $SUDO_USER ] && user=$SUDO_USER || user=`whoami`

cat <<EOF >/dev/stdout
download tigervnc success
see "http://sadeye.cn/post/linux配置tigervnc" and deploy
EOF

if [ "$1"  == "auto" ]; then
    cat <<EOF >/dev/stdout
-----------------------------
auto deploy by systemd
-----------------------------
EOF
[ -f "/home/${SUDO_USER}/.vnc/passwd" ] ||
  /opt/tigervnc/usr/bin/vncpasswd  /home/${SUDO_USER}/.vnc/passwd && \
  chown 777 /home/${SUDO_USER}/.vnc/passwd
cat <<EOF > /lib/systemd/system/tigervnc.service
[Unit]
Description=tigerVNC services

[Service]
Type=forking
User=${SUDO_USER}
Environment="DISPLAY=:0"
Restart=on-failure
RestartSec=5s
ExecStart=/opt/tigervnc/usr/bin/x0vncserver SecurityTypes=VncAuth PasswordFile=/home/${SUDO_USER}/.vnc/passwd

[Install]
WantedBy=default.target
EOF
systemctl daemon-reload
systemctl enable tigervnc
systemctl status tigervnc
else
  echo "if use param 'auto' will auto deploy systemd server"
fi
