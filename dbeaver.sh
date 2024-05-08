#!/bin/bash
#
# 自动安装dbeaver
#

_main() {
    which sudo >/dev/null && SUDO="sudo"

    cd /tmp \
    && wget --max-redirect=4 -c https://dbeaver.io/files/dbeaver-ce-latest-linux.gtk.x86_64.tar.gz \
    && chmod 666 dbeaver-ce-latest-linux.gtk.x86_64.tar.gz \
    && ${SUDO} tar -zxvf dbeaver-ce-latest-linux.gtk.x86_64.tar.gz -C /opt \
    && echo """[Desktop Entry]
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
    """ | ${SUDO} tee /usr/share/applications/dbeaver.desktop \
    && echo "install dbeaver latest success"
}

_main