from centos

RUN yum -y install mariadb

ADD init.sh /usr/local/init.sh

ENTRYPOINT ["/usr/local/init.sh"]
CMD ["run"]
