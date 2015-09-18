#!/bin/bash
mysql -hmysql -P3306 -uroot -psecret -e "create user lportal identified by 'lportal'; create database lportal CHARACTER SET utf8 COLLATE utf8_general_ci; grant all privileges on lportal.* to lportal; flush privileges;"
#mysql -hmysql -P3306 -ulportal -plportal lportal < /var/mysql/dump/liferaydb.sql
