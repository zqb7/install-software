#!/bin/bash
#
# 自动安装dbeaver
#
cd /tmp && wget --max-redirect=2 -c https://dbeaver.io/files/dbeaver-ce-latest-linux.gtk.x86_64.tar.gz && \
    tar -zxvf dbeaver-ce-latest-linux.gtk.x86_64.tar.gz -C /opt && \
    cd /opt

if [ $? -ne 0 ];then 
    echo "install dbeaver faild"
    exit 1
fi

cat <<EOF > /usr/share/applications/dbeaver.desktop
[Desktop Entry]
Version=1.0
Type=Application
Terminal=false
Name=DBeaver Community
GenericName=UniversaL Database Manager
Comment=Universal Database Manager and SQL Client.
Path=/opt/dbeaver/
Exec=/opt/dbeaver/dbeaver
Icon=/opt/dbeaver/dbeaver.png
Categories=IDE;Development
WMCLASS=DBeaver
StartupWMClass=DBeaver
StartupNotify=true
Keywords=Database;SQL;IDE;JDBC;ODBC;MySQL;PostgreSQL;Oracle;DB2;MariaDB
MimeType=application/sql
EOF

echo "install dbeaver success"