# Build Stage: Maven으로 WAR 파일 빌드
FROM arm32v7/maven:3.6.3 AS build

WORKDIR /app
COPY pom.xml .
COPY src/ ./src/

RUN mvn clean package

# Runtime Stage: Tomcat에 WAR 배포
FROM arm32v7/tomcat:9.0

RUN rm -rf /usr/local/tomcat/webapps/ROOT*
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
