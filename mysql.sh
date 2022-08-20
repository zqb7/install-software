#!/bin/bash

which sudo >/dev/null && SUDO="sudo"

_clear() {
    ${SUDO} rm -rf /var/lib/mysql /usr/local/mysql
}

# https://dev.mysql.com/doc/refman/5.7/en/data-directory-initialization.html

_main() {

    id -u mysql /dev/null || ${SUDO} useradd -s /sbin/nologin mysql

    ${SUDO} mkdir -p /usr/local/mysql \
    && ${SUDO} mkdir -p /var/lib/mysql /var/run/mysqld /etc/mysql \
    && ${SUDO} chown -R mysql:mysql /var/lib/mysql /var/run/mysqld \
    && ${SUDO} chmod 1777 /var/lib/mysql /var/run/mysqld
    if [ -z "$(ls -A -p /var/lib/mysql)" ]; then
        cd /tmp \
        && wget -c https://downloads.mysql.com/archives/get/p/23/file/mysql-5.7.35-linux-glibc2.12-x86_64.tar.gz \
        && tar zxvf mysql-5.7.35-linux-glibc2.12-x86_64.tar.gz \
        && ${SUDO} chown mysql:mysql /var/lib/mysql \
        && ${SUDO} mv mysql-5.7.35-linux-glibc2.12-x86_64/* /usr/local/mysql \
        && echo "PATH=\$PATH:/usr/local/mysql/bin" | ${SUDO} tee /etc/profile.d/mysql.sh >/dev/null \
        && . /etc/profile.d/mysql.sh \
        && echo """[mysqld]
user = mysql
pid-file        = /var/run/mysqld/mysqld.pid
socket          = /var/run/mysqld/mysqld.sock
datadir         = /var/lib/mysql
#default-character-set = utf8
character_set_server = utf8
#log-error      = /var/log/mysql/error.log
# By default we only accept connections from localhost
#bind-address   = 127.0.0.1
# Disabling symbolic-links is recommended to prevent assorted security risks
symbolic-links=0

[client]
port = 3306
socket = /var/run/mysqld/mysqld.sock
""" | ${SUDO} tee /etc/mysql/my.cnf >/dev/null \
        && mysqld --initialize-insecure --user=mysql --basedir=/usr/local/mysql --datadir=/var/lib/mysql \
        && cat <<EOF >/dev/stdout
---------------------------------
install mysql success
You need use "mysql -u root --skip-password" and run "ALTER USER 'root'@'localhost' IDENTIFIED BY 'root-password';" to set password

maybe you need "cp /usr/local/mysql/support-files/mysql.server /etc/init.d/mysql", to start  just run "/etc/init.d/mysql start"
OR See "https://dev.mysql.com/doc/refman/5.7/en/mysql-server.html" and set mysql server
---------------------------------
EOF
    else
        echo "fail: /var/lib/mysql is not empty"
    fi
}

_main