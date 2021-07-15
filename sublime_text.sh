#!/usr/bin/env bash

file_url="https://download.sublimetext.com/sublime_text_build_4113_x64.tar.xz"
file_name=`echo $file_url | awk -F '/' '{print $NF}'`

cd /tmp && wget -c $file_url && \
    rm -rf /opt/sublime_text  && \ 
    tar -xvf $file_name -C /opt/

if [ $? -ne 0 ];then 
    echo "install faild"
    exit 1 
fi

rm /usr/share/applications/sublime_text.desktop
ln -s /opt/sublime_text/sublime_text.desktop /usr/share/applications/sublime_text.desktop

cat <<EOF > /usr/bin/subl  && chmod +x /usr/bin/subl
#!/bin/sh
exec /opt/sublime_text/sublime_text --fwdargv0 "$0" "$@"
EOF

echo "install sublime_text success!"
