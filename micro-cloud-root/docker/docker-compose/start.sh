#/bin/bash
docker-compose -f mem-base-server.yml up -d
sleep 3s
docker-compose -f mem-base-config.yml up -d
docker-compose -f mem-base-zuul.yml up -d
sleep 50s
docker-compose -f mem-main-docker-compose.yml up -d
