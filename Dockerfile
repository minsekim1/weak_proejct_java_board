# Build Stage: Maven으로 WAR 파일 빌드
# Ubuntu
# FROM maven:3.8.6-openjdk-8 AS build

# Debian
FROM arm32v7/maven:3.6.3-openjdk-11 AS build

WORKDIR /app
# pom.xml과 소스코드를 복사
COPY pom.xml .
COPY src/ ./src/
# 클린 빌드 및 패키지 생성
RUN mvn clean package

# Runtime Stage: Tomcat에 WAR 배포
# Ubuntu
# FROM tomcat:9.0-jdk11-openjdk

# Debian
FROM arm32v7/tomcat:9.0 

# 기존 ROOT 애플리케이션 삭제 (선택 사항)
RUN rm -rf /usr/local/tomcat/webapps/ROOT*
# Maven 빌드 단계에서 생성된 WAR 파일을 Tomcat의 ROOT로 복사
COPY --from=build /app/target/controller-1.0.0-BUILD-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
