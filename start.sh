#!/bin/bash
mypath=/var/lib/mysql
if [ -d $mypath ]
then
    if [ -z "$(ls $mypath)" ]
    then
        chown -R mysql /var/lib/mysql
        chgrp -R mysql /var/lib/mysql
        mysql_install_db --user=mysql --ldata=/var/lib/mysql
    fi
    /usr/bin/mysqld_safe > /dev/null 2>&1 &
    sleep 5
    /usr/sbin/httpd -DFOREGROUND &
    /usr/bin/mysql -e "use mysql; update user set password=PASSWORD('pwd123') where User='root'; flush privileges;"
    sleep infinity
fi
exit 0