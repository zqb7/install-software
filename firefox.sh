#!/usr/bin/env bash

pushd /tmp >/dev/null
fileUrl="https://download-installer.cdn.mozilla.net/pub/firefox/releases/89.0/linux-x86_64/zh-CN/firefox-89.0.tar.bz2"
fileName="Firefox-latest-x86_64.tar.bz2"

wget -c $fileUrl -O $fileName || exit 1

tar -jxvf $fileName -C /opt/

if [ $? -ne 0 ];then 
    echo "install faild"
    exit 1
fi

popd >/dev/null

cat <<EOF > /opt/firefox/firefox.desktop
[Desktop Entry]
Version=1.0
Type=Application
Name=firefox
Icon=/opt/firefox/browser/chrome/icons/default/default128.png
Exec="/opt/firefox/firefox"
Comment=firefox;
Categories=Development;tool;
Terminal=false
StartupWMClass=firefox
EOF
ln -s /opt/firefox/firefox.desktop /usr/share/applications/firefox.desktop

ln -s /opt/firefox/firefox /usr/local/bin/firefox
echo "install firefox success!"
