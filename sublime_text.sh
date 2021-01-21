#!/usr/bin/env bash

pushd /tmp >/dev/null
file_url="https://download.sublimetext.com/sublime_text_3_build_3211_x64.tar.bz2"
file_name=`echo $file_url | awk -F '/' '{print $NF}'`

wget -c $file_url && \
    rm -rf /opt/sublime_text*  && \  # delete all sublime_text like version 2 or 3
    tar -jxvf $file_name -C /opt/


[ $? -eq 0 ] || echo "install faild";exit 1 

pushd /opt >/dev/null
mv sublime_text* sublime_text

popd >/dev/null

cat <<EOF > /opt/sublime_text.desktop
[Desktop Entry]
Version=1.0
Type=Application
Name=Sublime Text
GenericName=Text Editor
Comment=Sophisticated text editor for code, markup and prose
Exec=/opt/sublime_text/sublime_text %F
Terminal=false
MimeType=text/plain;
Icon=/opt/sublime_text/Icon/256x256/sublime-text.png
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
ln -s /opt/sublime_text/sublime_text.desktop /usr/share/applications/sublime_text.desktop

cat <<EOF > /usr/bin/subl  && chmod +x /usr/bin/subl
#!/bin/sh
exec /opt/sublime_text/sublime_text --fwdargv0 "$0" "$@"
EOF

echo "install sublime_text success!"