# OpenJDK 11 이미지를 기반으로 설정
FROM openjdk:11-jre-slim

# 작업 디렉터리 생성
WORKDIR /app

# 자바 소스 파일을 컨테이너에 복사
COPY . /app

# Maven을 사용하여 자바 프로젝트 빌드 (필요한 경우)
RUN apt-get update && apt-get install -y maven
RUN mvn clean install

# 자바 프로그램 실행
CMD ["java", "-cp", "target/your-app.jar", "com.yourpackage.SecureEncryption"]
