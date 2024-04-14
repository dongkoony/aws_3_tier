#!/bin/bash

# Docker를 설치하기 위해 필요한 패키지 업데이트
sudo apt update

# Docker 설치를 위해 필요한 패키지 설치
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Docker 공식 GPG 키 추가
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Docker 공식 레파지토리 추가
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# 패키지 업데이트 및 Docker CE 설치
sudo apt update
sudo apt install -y docker-ce

# Docker 서비스 시작
sudo systemctl start docker

# Docker 서비스가 부팅시 자동으로 시작되도록 설정
sudo systemctl enable docker

# 현재 사용자를 docker 그룹에 추가하여 sudo 없이 Docker를 사용할 수 있도록 권한 부여
sudo usermod -aG docker ${USER}

# 사용자 그룹 변경을 적용하기 위해 로그아웃 후 다시 로그인하거나 다음 명령 실행
echo "로그아웃 후 다시 로그인하거나 'newgrp docker' 명령을 실행하여 Docker 권한을 적용하세요."
