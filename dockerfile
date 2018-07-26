FROM centos:6.8
MAINTAINER svisback@gmail.com
RUN yum install -y epel-release >> /dev/null
RUN yum  -y update
RUN yum install -y which sudo mysql-server openssh-server
RUN echo "/sbin/service  mysqld  start" >> /root/.bashrc
Run echo '/usr/bin/mysqladmin -u root password 'new-password' ' >>  /root/.bashrc
RUN echo "mysql -u root -pnew-password -e "\""DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1')"\"" "  >> /root/.bashrc
RUN echo "mysql -u root -pnew-password -e "\""DELETE FROM mysql.user WHERE User=''"\"" " >> /root/.bashrc
RUN echo "mysql -u root -pnew-password -e "\""DELETE FROM mysql.db WHERE Db='test' OR Db='test\_%'"\"" " >> /root/.bashrc
RUN echo "mysql -u root -pnew-password -e "\""FLUSH PRIVILEGES"\"" " >> /root/.bashrc
RUN echo "mysql -u root -pnew-password -e "\""CREATE DATABASE wordpress"\"" " >> /root/.bashrc
RUN echo "mysql -u root -pnew-password -e "\""CREATE USER wordpressuser@localhost IDENTIFIED BY 'password'"\"" " >> /root/.bashrc
RUN echo "mysql -u root -pnew-password -e "\""GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpressuser'@'172.17.0.%'  IDENTIFIED BY 'password'"\"" " >> /root/.bashrc
