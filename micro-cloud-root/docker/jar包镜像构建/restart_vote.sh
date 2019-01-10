#!/bin/bash
result=$(sudo docker ps -a | grep voteapp-1.0 | awk '{print $1}')
if [ "$result" != "" ];then

	docker rm -f $result

fi
sudo docker run -d -p 8000:8000 --restart=always --name=voteapp-1.0 voteapp:1.0
