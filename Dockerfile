FROM centos:6.8
MAINTAINER svisback@gmail.com
RUN yum install -y epel-release >> /dev/null
RUN yum  -y update
RUN yum install -y which sudo httpd php openssh-server >> /dev/null
RUN echo "/sbin/service httpd start" >> /root/.bashrc
RUN echo "/sbin/service sshd  start" >> /root/.bashrc
Expose 80
