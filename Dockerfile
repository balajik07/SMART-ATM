# Step 1: Build WAR using Ant
FROM openjdk:8-jdk AS build

WORKDIR /app
COPY . .

RUN apt-get update && apt-get install -y ant
RUN ant clean
RUN ant dist

# Step 2: Deploy WAR in Tomcat
FROM tomcat:9.0

COPY --from=build /app/dist/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]