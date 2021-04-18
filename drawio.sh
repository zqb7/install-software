#!/bin/bash

VERSION="14.5.1"

if [ -n "$1" ];then VERSION=$1; fi

FILEURL=https://github.com/jgraph/drawio-desktop/releases/download/v${VERSION}/drawio-x86_64-${VERSION}.AppImage

cd /tmp && wget -c $FILEURL -O drawio.AppImage && \
    if [ -d "/opt/drawio" ];then mkdir -p /opt/drawio;fi && \
    mv drawio.AppImage /opt/drawio && \
    cd /opt/drawio && \
    chmod +x drawio.AppImage && \
    cat <<EOF > drawio.svg
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
<svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="128px" height="128px" viewBox="0 0 128 128" enable-background="new 0 0 128 128" xml:space="preserve">  <image id="image0" width="128" height="128" x="0" y="0"
    href="data:image/png;base64,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" />
</svg>
EOF

cat <<EOF > /usr/share/applications/drawio.desktop
[Desktop Entry]
Name=drawio
Exec=/opt/drawio/drawio.AppImage
Terminal=false
Type=Application
Icon=/opt/drawio/drawio.svg
StartupWMClass=drawio
X-AppImage-Version=${VERSION}
Comment=diagrams.net desktop
MimeType=application/vnd.jgraph.mxfile;application/vnd.visio;
Categories=Graphics;
EOF
if [ $? -ne 0 ];then 
    echo "install faild"
    exit 1
else
    echo "install drawio  ${VERSION} success"
fi