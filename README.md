# AWS 3-Tier 아키텍처 구축
![aws_3-tier_architecture](https://github.com/dongkoony/aws_3_tier/assets/109497684/8f63b8aa-ed96-4588-9ca5-d644446fec4c)

## 프로젝트 개요: AWS 3-Tier 아키텍처 구축
**목표:**
이 프로젝트의 목표는 IaC Tool인 Terraform, Amazon Web Services (AWS) 클라우드 플랫폼을 사용하여 안정적이고 확장 가능한 3-Tier 웹 애플리케이션 아키텍처를 자동으로 구축하고 관리하는 것입니다. 이 아키텍처는 웹 서버(Nginx), 애플리케이션 서버 및 데이터베이스 서버로 구성됩니다.

## 프로젝트 주요 구성 요소

**테라폼 코드:**
프로젝트는 테라폼 코드를 사용하여 AWS 클라우드 리소스를 정의하고 관리합니다.
테라폼 코드는 인프라스트럭처를 프로그래밍 방식으로 설계하고 프로비저닝하는 데 사용됩니다.

**네트워크 및 보안:**
Virtual Private Cloud (VPC)를 설정하여 네트워크 분리 및 보안 그룹을 관리합니다.
인터넷 및 내부 서브넷을 구성하여 서버 및 데이터베이스의 네트워크 격리를 유지합니다.

### AWS 3-Tier
**웹 서버 (Web Tier):**
Nginx 웹 서버를 사용하여 정적 및 동적 콘텐츠를 제공합니다.
Auto Scaling 그룹을 통해 확장 가능한 웹 서버 구성을 구현합니다.

**애플리케이션 서버 (Application Tier):**
웹 애플리케이션을 호스팅하는 서버 그룹입니다.
자동으로 확장 및 축소되는 Auto Scaling 그룹을 구성합니다.
애플리케이션 코드를 배포하는 스크립트를 실행하여 CI/CD를 구현합니다.

**데이터베이스 서버 (Database Tier):**
Amazon RDS (Relational Database Service)를 사용하여 관계형 데이터베이스를 호스팅합니다.
데이터베이스 보안 및 백업 설정을 구성합니다.
