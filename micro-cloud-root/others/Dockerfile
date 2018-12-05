FROM frolvlad/alpine-oraclejdk8:slim
RUN apk add --no-cache tzdata \
        && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
        && echo "Asia/Shanghai" > /etc/timezone
