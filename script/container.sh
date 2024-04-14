# 젠킨스 이미지 가져오기
docker pull jenkins/jenkins

# 젠킨스 컨테이너 실행
docker run -d -p 8081:8080 -p 50000:50000 --name jenkins_master jenkins/jenkins