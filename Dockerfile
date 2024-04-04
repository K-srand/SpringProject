# Docker를 올릴 때 jdk17 버전을 이용
FROM openjdk:17

#이메일 메타데이터 지정(MAINTAINER는 더이상 사용X, LABEL 사용)
LABEL email="ksuji9278@gmail.com"

#host서버 저장소(컨테이터 휘발성으로)
VOLUME /tmp

#컨테이너의 8081 포트 연결(필수X, 실제 바인드 맵핑 필요함.)
EXPOSE 8081

#JAR_FILE 변수 선언
ARG JAR_FILE=build/libs/*.jar

#도커 호스트 파일 및 디렉토리를 도커 이미지로 복사(경로:D:\Spring\Project\hello-spring\build\libs)
COPY ${JAR_FILE} hello-spring-0.0.1-SNAPSHOT.jar

#컨테이너 시작 시 항상 실행될 명령어 지정(추가 인자 덮어쓰기 불가)
ENTRYPOINT ["java","-jar","/hello-spring-0.0.1-SNAPSHOT.jar"]