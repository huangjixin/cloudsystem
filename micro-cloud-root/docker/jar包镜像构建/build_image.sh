#!/bin/bash
result=$(sudo docker ps -a | grep voteapp-1.0 | awk '{print $1}')
if [ "$result" != "" ];then

        docker rm -f $result

fi

result=$(sudo docker images | grep voteapp | awk '{print $3}')
if [ "$result" != "" ];then

        docker rmi -f $result

fi
sudo docker build -t voteapp:1.0 .
