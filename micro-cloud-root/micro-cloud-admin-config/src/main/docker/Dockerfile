FROM frolvlad/alpine-oraclejdk8:slim
VOLUME /tmp
ADD *.jar app.jar
#RUN sh -c 'touch /app.jar'
#ENV JAVA_OPTS="-Xms256m -Xmx512m"
ENV JAVA_OPTS=""
ENV PROFILE="dev"
ENV HOST="localhost"
EXPOSE 8762
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -jar /app.jar --eureka.client.serviceUrl.defaultZone=http://$HOST:8761/eureka/ --spring.cloud.config.profile=$PROFILE" ]