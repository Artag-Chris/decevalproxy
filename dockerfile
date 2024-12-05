FROM openjdk:8
VOLUME /tmp
ARG JAR_FILE
COPY ./target/deceval-0.0.1-SNAPSHOT.jar app.jar
## hay que cambiar este archivo de abajo
COPY ./keys/SSLClientAutoGen.jks /SSLClientAutoGen.jks
## hay que cambiar este WSSecurityStore.jks ya que no esta bien
COPY ./keys/WSSecurityStore.jks /WSSecurityStore.jks
COPY ./src/main/resources/application-docker.properties client.properties
ENV  PATH_CLIENT_PROPERTIES client.properties
ENV  PATH_LOGS ./server.log
EXPOSE 9000
ENTRYPOINT ["java","-jar","/app.jar"]