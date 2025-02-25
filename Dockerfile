# Base image: Tomcat (라즈베리파이 지원)
FROM arm32v7/tomcat:9.0

# 기존 Tomcat 기본 애플리케이션 삭제
RUN rm -rf /usr/local/tomcat/webapps/ROOT*

# 로컬에서 빌드한 WAR 파일을 컨테이너에 복사
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
