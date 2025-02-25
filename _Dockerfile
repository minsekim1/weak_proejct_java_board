FROM tomcat:9.0-jdk11-openjdk

# 기본 ROOT 애플리케이션 제거 (선택 사항)
RUN rm -rf /usr/local/tomcat/webapps/ROOT*

# 생성된 WAR 파일을 Tomcat의 webapps 디렉토리로 복사
COPY target/weak-java-project-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
