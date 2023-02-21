docker run -p $1:3306 --name mysql-$1 \
--restart always \
-v /data/mysql/$1/conf:/etc/mysql \
-v /data/mysql/$1/logs:/var/log/mysql \
-v /data/mysql/$1/data:/var/lib/mysql \
-e MYSQL_ROOT_PASSWORD=123456 \
-d mysql:5.7
