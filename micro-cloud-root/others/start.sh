#!/bin/bash
echo '================开始安装docker================'
docker=$(sudo docker -v)
if [ '$docker' == '' ];then
	yum install docker
else 
	echo 'docker已安装'
fi
echo '================安装docker完毕================'

echo '=========开始创建swarm集群Leader结点=========='
swarm=$(docker swarm join-token manager)
if [ $swarm == *ERROR* ];then
	echo '集群已存在'
else 
	sudo docker swarm init
echo '=========创建swarm集群Leader结点完毕=========='

echo '===========开始添加集群其他结点==============='
token=$(sudo docker swarm join-token manager | grep -A 2 join)
echo ''
mark=0
while [ $mark == 0 ]
do
	read -p '是否需要添加其他结点机器( y,yes,n,no )( 以下按住ctrl+backspace可删除错误输入 ):' answer
        if [ $answer == 'y' -o $answer == 'yes' ];then
        	read -p '请输入ip:' ip
       		read -p '请输入ssh端口:' port
        	read -p '请输入远程用户:' username
                ssh -p $port $username@$ip "yum install docker;sudo $token;mkdir $(PWD)"
		scp -r -P $port ../mytest $username@$ip
        elif [ $answer == 'n' -o $answer == 'no' ];then
                mark=1
        else
             read -p '请输入y,yes,n,no:' answer
        fi
done
echo '===========添加集群其他结点完毕==============='

#echo '===============开始构建基础镜像==============='
#baseImage=$(sudo docker images | grep frolvlad/alpine-oraclejdk8:CST)
#if [ '$baseImage' == '' ];then
#	sudo docker build -t frolvlad/alpine-oraclejdk8:CST .
#else 
#	echo '已存在基础镜像'
#fi
#echo '===============构建基础镜像完毕==============='

echo '===============开始载入所有镜像==============='
sudo docker load -i bhmall.tar
echo '===============载入所有镜像完毕==============='

echo '===============开始移除所有旧容器==============='
old_comtainer=$(sudo docker service ls | grep bhmall | awk '{print $1}')
if [ "$old_comtainer" != "" ]; then
	sudo docker service rm $(sudo docker service ls | grep bhmall | awk '{print $1}')
fi
echo '===============移除所有旧容器完毕==============='

echo '===============开始移除空名镜像==============='
old_images=$(sudo docker images | grep none | awk '{print $3}')
if [ "$old_images" != "" ]; then
	sudo docker rmi -f $(sudo docker images | grep none | awk '{print $3}')
fi
echo '===============移除空镜像完毕==============='

echo '=================开始运行镜像==================='
source ./mypath
sudo docker network create --driver overlay --subnet 10.0.9.0/24 --opt encrypted bhmall-overlay

echo '===启动mysql==='
sudo docker stack deploy -c ./docker-compose/mysql.yml bhmall

echo '===启动redis==='
sudo docker stack deploy -c ./docker-compose/redis.yml bhmall

echo '===启动nginx==='
sudo docker stack deploy -c ./docker-compose/nginx.yml bhmall

echo ''
mark=0
read -p '是否启动admin( y,yes,n,no ):' answer
while [ $mark == 0 ]
do
        if [ $answer == 'y' -o $answer == 'yes' ];then
                mark=1
        elif [ $answer == 'n' -o $answer == 'no' ];then
                mark=2
        else
             read -p '请输入y,yes,n,no:' answer
        fi
done

if [ $mark == 1 ];then
	echo '===启动admin==='
	sudo docker stack deploy -c ./docker-compose/admin_server.yml bhmall

	sudo docker stack deploy -c ./docker-compose/admin_config.yml bhmall

	sudo docker stack deploy -c ./docker-compose/admin_zuul.yml bhmall

	sleep 60s
	sudo docker stack deploy -c ./docker-compose/admin_main.yml bhmall
fi

echo ''
mark=0
read -p '是否启动mem( y,yes,n,no ):' answer
while [ $mark == 0 ]
do
        if [ $answer == 'y' -o $answer == 'yes' ];then
                mark=1
        elif [ $answer == 'n' -o $answer == 'no' ];then
                mark=2
        else
             read -p '请输入y,yes,n,no:' answer
        fi
done

if [ $mark == 1 ];then
	echo '===启动mem==='
	sudo docker stack deploy -c ./docker-compose/mem_server.yml bhmall

	sudo docker stack deploy -c ./docker-compose/mem_config.yml bhmall

	sudo docker stack deploy -c ./docker-compose/mem_zuul.yml bhmall

	sleep 60s
	sudo docker stack deploy -c ./docker-compose/mem_main.yml bhmall
fi

echo '=================运行镜像完毕==================='





