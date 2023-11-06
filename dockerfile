FROM ubuntu
WORKDIR /opt
RUN apt update -y && apt install default-jre -y && apt install maven -y && apt install git -y && git clone https://github.com/ElevenDevOps/elevenDevOps_ProjectCode.git && cd elevenDevOps_ProjectCode && mvn clean package


FROM tomee
COPY --from=0 /opt/elevenDevOps_ProjectCode/target/maven-web-application.war /usr/local/tomee/webapps
EXPOSE 8080
