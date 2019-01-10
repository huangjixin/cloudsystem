FROM frolvlad/alpine-oraclejdk8:CST
VOLUME /tmp
ADD *.jar app.jar
#RUN sh -c 'touch /app.jar'
ENV JAVA_OPTS="-Xms80m -Xmx128m"
EXPOSE 8000
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]
