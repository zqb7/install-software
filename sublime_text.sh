#!/usr/bin/env bash

file_url="https://download.sublimetext.com/sublime_text_3_build_3211_x64.tar.bz2"
file_name=`echo $file_url | awk -F '/' '{print $NF}'`

cd /tmp && wget -c $file_url && \
    rm -rf /opt/sublime_text_3  && \ 
    tar -jxvf $file_name -C /opt/

if [ $? -ne 0 ];then 
    echo "install faild"
    exit 1 
fi

cat <<EOF > /opt/sublime_text_3/sublime_text.desktop
[Desktop Entry]
Version=1.0
Type=Application
Name=Sublime Text
GenericName=Text Editor
Comment=Sophisticated text editor for code, markup and prose
Exec=/opt/sublime_text_3/sublime_text %F
Terminal=false
MimeType=text/plain;
Icon=/opt/sublime_text_3/Icon/256x256/sublime-text.png
Categories=TextEditor;Development;
StartupNotify=true
Actions=Window;Document;

[Desktop Action Window]
Name=New Window
Exec=/opt/sublime_text/sublime_text -n
OnlyShowIn=Unity;

[Desktop Action Document]
Name=New File
Exec=/opt/sublime_text/sublime_text --command new_file
OnlyShowIn=Unity;
EOF

rm /usr/share/applications/sublime_text.desktop
ln -s /opt/sublime_text_3/sublime_text.desktop /usr/share/applications/sublime_text.desktop

cat <<EOF > /usr/bin/subl  && chmod +x /usr/bin/subl
#!/bin/sh
exec /opt/sublime_text_3/sublime_text --fwdargv0 "$0" "$@"
EOF

echo "install sublime_text success!"
