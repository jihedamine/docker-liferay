#!/bin/bash

sudo docker create --name mysqldata_1 -v ${PWD}/volumes/mysqldata busybox

sudo docker run -t --name mysql_1 -e MYSQL_ROOT_PASSWORD=secret --volumes-from mysqldata_1 --publish 0.0.0.0:3306:3306 -d mysql:5.5

sleep 30

sudo docker exec -i mysql_1 mysql -uroot -psecret < initdb.sql

sudo docker run -v ${PWD}/volumes/liferaydata:/opt/liferay-portal/data --name liferaydata_1 busybox

docker build -t liferay liferay/.

sudo docker run --name liferay_1 -it -v /tmp/deploy:/opt/liferay-portal/deploy --volumes-from liferaydata_1 --link mysql_1:mysql --publish 0.0.0.0:8080:8080 -d liferay

#sudo docker exec -it liferay_1 bash

