#!/bin/bash
/usr/bin/mysqld_safe > /dev/null 2>&1 &
sleep 5
/usr/sbin/httpd -DFOREGROUND &
/usr/bin/mysql -e "use mysql; update user set password=PASSWORD('pwd123') where User='root'; flush privileges;"
sleep infinity
exit 0
