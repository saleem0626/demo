FROM lolhens/baseimage-openjre
ADD target/springbootApp.war springbootApp.war
EXPOSE 8085
ENTRYPOINT ["java", "-jar", "springbootApp.war"]
