docker run -d -p $1:6379 -v /data/redis/$1:/data -d --net=host --name redis-$1 redis:4.0 --appendonly yes --requirepass 123456 --restart always
