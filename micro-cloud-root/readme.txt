1.使用命令行構建的時候，用clean install -Dskip.test=true跳過測試。
--------Nginx镜像创建
docker run --name cloudsystem-nginx -p 80:80 -v /u06/huangjixin/package/docker-compose/nginx/html:/usr/share/nginx/html -v /u06/huangjixin/package/docker-compose/nginx/nginx.conf:/etc/nginx/nginx.conf  -v /data/nginx/logs:/var/log/nginx -v /u06/huangjixin/package/docker-compose/nginx/conf.d:/etc/nginx/conf.d -d nginx

记得开好端口号！！！！！！！！！

查看容器日志 docker logs -f  容器ID -f参数表示一直查看，退出ctrl+c

---Rancher镜像创建 docker run --restart=always --name rancher -d -p 8889:8080 rancher/server:stable

------------- 集群模式下运行容器
echo '移除含有名字含有micro-cloud字符串的镜像开始'
old_comtainer=$(sudo docker service ls | grep micro-cloud | awk '{print $1}')
if [ "$old_comtainer" != "" ]; then
	docker service rm  $(docker  service ls | grep micro-cloud  | awk '{print $1}')
fi


echo '移除含有名字含有micro-cloud字符串的镜像结束'

echo '跳转至/root/.jenkins/workspace/'+$JOB_NAME+'/micro-cloud-root'

cd /root/.jenkins/workspace/$JOB_NAME/micro-cloud-root

echo '执行Docker-compose(集群)开始，包含基础容器server,config,zuul开始'
docker stack deploy -c micro-cloud-base-compose.yml base
echo '执行Docker-compose(集群)结束，包含基础容器server,config,zuul结束，休眠60秒'
sleep 60s
echo '执行micro-cloud-system-compose系统模块开始'
docker stack deploy -c micro-cloud-system-compose.yml system
echo '执行micro-cloud-system-compose系统模块结束'


-------- 安装docker环境
yum install -y docker
systemctl start docker
systemctl enable docker

---- 运行单机docker-compose命令
cd /root/.jenkins/workspace/$JOB_NAME/micro-cloud-root
echo '执行Docker-compose开始，包含基础容器server,config,zuul开始'
docker-compose -f micro-cloud-base-compose.yml up -d
echo '执行Docker-compose开始，包含基础容器server,config,zuul结束，休眠60秒'
sleep 60s
echo '执行micro-cloud-system-compose系统模块开始'
docker-compose -f micro-cloud-system-compose.yml up -d
echo '执行micro-cloud-system-compose系统模块结束'

---- 单机版移除docker命令
old_comtainer=$(sudo docker ps -a | grep micro-cloud | awk '{print $1}')
if [ "$old_comtainer" != "" ]; then
	docker rm -f $(docker ps -a | grep micro-cloud  | awk '{print $1}')
fi
（集群版没有-f，单机才有）







-----------------------------------------------------------------------------------------------
----------- 使用maven构建的步骤															 ----------
-----------------------------------------------------------------------------------------------
1.调用Maven顶层目标：clean package install -Dmaven.test.skip=true docker:build

2.执行命令：
#!/bin/bash
#echo '登录阿里云私有镜像开始'
#sudo docker login --username=张志成928871247 --password=zzc123456 registry.cn-shenzhen.aliyuncs.com
#echo '登录阿里云私有镜像结束'
#echo '打标签开始'
#sudo docker tag micro-cloud-admin-server:0.0.1 registry.cn-shenzhen.aliyuncs.com/zhangzhicheng/zhangzhicheng:micro-cloud-admin-server-0.0.1
#sudo docker tag micro-cloud-admin-config:0.0.1 registry.cn-shenzhen.aliyuncs.com/zhangzhicheng/zhangzhicheng:micro-cloud-admin-config-0.0.1
#sudo docker tag micro-cloud-admin-zuul:0.0.1 registry.cn-shenzhen.aliyuncs.com/zhangzhicheng/zhangzhicheng:micro-cloud-admin-zuul-0.0.1
#sudo docker tag micro-cloud-admin-system:0.0.1 registry.cn-shenzhen.aliyuncs.com/zhangzhicheng/zhangzhicheng:micro-cloud-admin-system-0.0.1
#echo '打标签结束'

#echo '推送到阿里云开始'
#sudo docker push registry.cn-shenzhen.aliyuncs.com/zhangzhicheng/zhangzhicheng:micro-cloud-admin-server-0.0.1
#sudo docker push registry.cn-shenzhen.aliyuncs.com/zhangzhicheng/zhangzhicheng:micro-cloud-admin-config-0.0.1
#sudo docker push registry.cn-shenzhen.aliyuncs.com/zhangzhicheng/zhangzhicheng:micro-cloud-admin-zuul-0.0.1
#sudo docker push registry.cn-shenzhen.aliyuncs.com/zhangzhicheng/zhangzhicheng:micro-cloud-admin-system-0.0.1
#echo '推送到阿里云结束'


echo '移除含有名字含有micro-cloud字符串的服务开始'
old_service=$(sudo docker service ls | grep micro-cloud | awk '{print $1}')
if [ "$old_service" != "" ]; then
	docker service rm  $(docker service ls | grep micro-cloud  | awk '{print $1}')
fi
sleep 20s
echo '移除含有名字含有micro-cloud字符串的服务结束'

echo '退出集群'
docker swarm leave --force &
sleep 10s

echo '创建集群'
docker swarm init &
sleep 10s
echo '集群创建成功'

echo '开始创建添加集群结点shell文件'
echo $(docker swarm join-token worker | tail -n 2) > ./micro-cloud-root/others/join.sh
chmod 755 ./micro-cloud-root/others/join.sh
echo '创建添加集群结点shell文件完毕'

echo '移除含有名字含有micro-cloud字符串的容器开始'
old_comtainer=$(sudo docker ps -a | grep micro-cloud | awk '{print $1}')
if [ "$old_comtainer" != "" ]; then
	docker rm -f  $(docker ps -a | grep micro-cloud  | awk '{print $1}')
fi
echo '移除含有名字含有micro-cloud字符串的容器结束'

echo '移除含有名字含有none字符串的镜像开始'
old_images=$(docker images | grep none | awk '{print $3}')
if [ "$old_images" != "" ]; then
	docker rmi -f $(docker images | grep none  | awk '{print $3}')
fi
echo '移除含有名字含有none字符串的镜像结束'

rm -f ./micro-cloud-root/others/micro-cloud.tar
docker save -o ./micro-cloud-root/others/micro-cloud.tar $(docker images | grep micro-cloud | grep 0.0.1 | awk '{print $1":"$2}')

cd ./micro-cloud-root/others/
rm -f images.tar
tar cvf images.tar *
mv images.tar ../../images.tar

3.使用ssh对其它机器进行打包加载：
Source file:images.tar
Remote directory:/u06/root/pkg/others/
Exec command:
#!/bin/bash
echo '退出集群'
docker swarm leave --force &
sleep 10s

echo '运行添加集群结点shell文件'
cd /u06/root/pkg/others/
tar -xf images.tar
rm -f images.tar
./join.sh 
echo '加入集群成功'

echo '加载镜像开始'
docker load -i micro-cloud.tar
echo '加载镜像完毕'

echo '移除含有名字含有none字符串的容器开始'
old_container=$(docker ps -a | grep micro-cloud | awk '{print $1}')
if [ "$old_container" != "" ]; then
	docker rm -f $(docker ps -a | grep micro-cloud  | awk '{print $1}')
fi
echo '移除含有名字含有none字符串的容器结束'

echo '移除含有名字含有none字符串的镜像开始'
old_images=$(docker images | grep none | awk '{print $3}')
if [ "$old_images" != "" ]; then
	docker rmi -f $(docker images | grep none  | awk '{print $3}')
fi
echo '移除含有名字含有none字符串的镜像结束'

4.执行shell脚本：
#!/bin/bash
#echo '移除含有名字含有micro-cloud字符串的容器开始'
#old_comtainer=$(sudo docker service ls | grep micro-cloud | awk '{print $1}')
#if [ "$old_comtainer" != "" ]; then
#	docker service rm  $(docker  service ls | grep micro-cloud  | awk '{print $1}')
#fi

#echo '移除含有名字含有micro-cloud字符串的容器结束'

echo '创建overlay网络开始'
docker network create -d overlay --subnet=10.10.0.0/16 --gateway=10.10.0.254 --attachable=true cloudsystem-overlay &
sleep 10s
echo '创建overlay网络结束'

echo '跳转至/root/.jenkins/workspace/'$JOB_NAME'/micro-cloud-root'

cd /root/.jenkins/workspace/$JOB_NAME/micro-cloud-root

echo '执行Docker-compose(集群)开始，包含基础容器server,config,zuul开始'
docker stack deploy -c micro-cloud-base-compose.yml base
echo '执行Docker-compose(集群)结束，包含基础容器server,config,zuul结束，休眠60秒'
sleep 60s

echo '执行micro-cloud-system-compose系统模块开始'
docker stack deploy -c micro-cloud-system-compose.yml system
echo '执行micro-cloud-system-compose系统模块结束'
sleep 3s

echo '执行micro-cloud-security-compose安全模块开始'
docker stack deploy -c micro-cloud-security-compose.yml system
echo '执行micro-cloud-security-compose安全模块结束'
sleep 3s

echo '执行micro-cloud-member-compose会员模块开始'
docker stack deploy -c micro-cloud-member-compose.yml system
echo '执行micro-cloud-member-compose会员模块结束'
sleep 3s

echo '执行micro-cloud-goods-compose商品模块开始'
docker stack deploy -c micro-cloud-goods-compose.yml system
echo '执行micro-cloud-goods-compose商品模块结束'
