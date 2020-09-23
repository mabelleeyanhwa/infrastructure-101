FROM java:8-jdk-alpine
COPY ./hello-spring-boot-0.1.0.jar /usr/app/
WORKDIR /usr/app
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "hello-spring-boot-0.1.0.jar"]