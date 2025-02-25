# weak_proejct_java_board
java언어 취약적 분석 테스트 시료 (JAVA 언어)

# 취약점 분석 방법
## 도커 컨테이너 빌드 및 실행

```
docker build -t weak-java-project .
docker run weak-java-project
```

# Docker 이미지에서 SBOM 생성
## Syft 설치
- `brew install syft`
## Docker 이미지에서 SBOM 생성
- `syft weak-java-project -o cyclonedx-json > sbom.json`
## SBOM 업로드 분석
- 업로드 분석 버튼 누르고 해당 sbom.json 업로드


# 프로젝트 개요

- 사이버보안 팀에서 생성한 게시판 프로젝트입니다.
- 이 프로젝트는 Model-View-Controller(MVC) 패턴을 적용하여 개발되었습니다.
- 게시판의 각 기능 : 조회, 작성, 상세보기, 삭제
- 이러한 기능들은 모두 서블릿과 JSP를 활용하여 구현되었으며, 데이터베이스와의 연동을 통해 동적인 웹 페이지를 생성하고 있습니다.

# 도커 명령어 리스트
```
(옵션) mvn clean package
sudo docker build -t my-java-app .
sudo docker run -d -p 8080:8080 my-java-app

sudo docker ps
sudo docker logs -f f362ccf98a5e

sudo docker stop f362ccf98a5e
sudo docker rm f362ccf98a5e
sudo docker rmi -f my-java-app
```