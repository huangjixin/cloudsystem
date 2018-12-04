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