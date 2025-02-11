# weak_proejct_java_board
java언어 취약적 분석 테스트 시료 (JAVA 언어)

# 취약점 분석 방법
## 도커 컨테이너 빌드 및 실행
```
docker build -t weak-java-project .
docker run weak-java-project
````
# Docker 이미지에서 SBOM 생성
## Syft 설치
- `brew install syft``
## Docker 이미지에서 SBOM 생성
- `syft weak-java-project -o cyclonedx-json > sbom.json`
## SBOM 업로드 분석
- 업로드 분석 버튼 누르고 해당 sbom.json 업로드


# 프로젝트 개요

- 자바로 XOR 암호화와 보안에 취약한 난수 생성기 문제를 해결하는 예시 코드입니다.

1. Java로 보안 취약점 개선
XOR 암호화는 여전히 보안에 취약하므로, 안전한 AES 암호화 방식으로 변경하는 것이 좋습니다.
java.util.Random 대신 보안적으로 안전한 SecureRandom을 사용합니다.