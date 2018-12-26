FROM frolvlad/alpine-oraclejdk8:slim
VOLUME /tmp
ADD *.jar app.jar
#RUN sh -c 'touch /app.jar'
#ENV JAVA_OPTS="-Xms256m -Xmx512m"
ENV JAVA_OPTS=""
ENV PROFILE="dev"
ENV HOST="localhost"
ENV CONFIG="localhost"
ENV TXHOST="localhost"
EXPOSE 8765
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -jar /app.jar --eureka.client.serviceUrl.defaultZone=http://$HOST:8761/eureka/ --spring.cloud.config.discovery.enabled=false --spring.cloud.config.uri=http://$CONFIG:8762/ --spring.cloud.config.profile=$PROFILE --tm.manager.url=http://$TXHOST:8899/tx/manager/" ]