FROM centos
VOLUME /var/lib/mysql/
RUN yum install -y epel-release
RUN yum install -y mariadb-server
RUN yum install -y httpd
RUN yum install -y php php-mysql php-mbstring php-mcrypt
ADD https://files.phpmyadmin.net/phpMyAdmin/4.0.10.20/phpMyAdmin-4.0.10.20-all-languages.tar.gz /var/www/html/phpmyadmin.tar.gz
ADD start.sh /start.sh
RUN /bin/tar -xvf /var/www/html/phpmyadmin.tar.gz -C /var/www/html/
RUN /bin/ln -snf /var/www/html/phpMyAdmin-4.0.10.20-all-languages/ /var/www/html/phpmyadmin
CMD ["/bin/sh", "/start.sh"]
