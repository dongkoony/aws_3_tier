![header](https://capsule-render.vercel.app/api?type=Venom&color=0078D7&height=200&section=header&text=Building_an_AWS_3-Tier_Architecture&fontSize=40&fontColor=703EE5&animation=twinkling)

![aws_3-tier_architecture](https://github.com/dongkoony/aws_3_tier/assets/109497684/8f63b8aa-ed96-4588-9ca5-d644446fec4c)

## 프로젝트 개요: AWS 3-Tier 아키텍처 구축
**목표:**
이 프로젝트의 목표는 Terraform, Amazon Web Services (AWS) 클라우드 플랫폼을 사용하여 안정적이고 확장 가능한 3-Tier 웹 애플리케이션 아키텍처를 자동으로 구축하고 관리하는 것입니다. 이 아키텍처는 웹 서버(Nginx), 애플리케이션 서버 및 데이터베이스 서버로 구성됩니다.

## 프로젝트 주요 구성 요소

**Infrastructure as Code (Terraform):**
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

## 프로젝트 주요 단계

**테라폼 코드 작성:**
테라폼 코드를 사용하여 AWS 리소스를 정의하고 관리합니다. 이 코드는 인프라스트럭처를 설계하고 프로비저닝하는 데 사용됩니다.

**인프라스트럭처 배포:**
테라폼 코드를 사용하여 AWS 클라우드에 3-Tier 아키텍처를 배포합니다.

**자동화 및 관리:**
Auto Scaling을 활용하여 웹 서버 및 애플리케이션 서버의 확장과 축소를 자동화합니다. CI/CD 파이프라인을 설정하여 애플리케이션 배포를 자동화하고 데이터베이스 관리 및 보안을 유지합니다.

**모니터링 및 로깅:**
AWS CloudWatch 및 로깅 서비스를 사용하여 인프라스트럭처 및 애플리케이션의 상태를 모니터링하고 이벤트 및 경고를 설정합니다.

## 프로젝트 기대 결과값
이 프로젝트를 완료하면 안정적이며 확장 가능한 3-Tier 아키텍처가 AWS 클라우드에서 자동으로 구축되며 애플리케이션 배포와 관리가 간소화될 것입니다. 
이 아키텍처는 웹 트래픽의 증가에 따라 확장되고 감소하며 안전한 데이터베이스 백업 및 보안을 유지합니다.

## 설치 및 사용법

### 이 저장소를 클론합니다.
   ```bash
   git clone https://github.com/dongkoony/aws_3_tier.git
   cd aws_3_tier
   ```

### Version
  ```bash
  Terraform > v1.7.1
  aws-cli > 2.15.14
  ```

### AWS Configuration
  ``` bash
  // AWS Access Key, Secret Key 구성
  aws configure
  
  // 설정 AWS IAM 액세스 key
  AWS Access Key ID [None] :
  AWS Secret Access Key [None] :
  Default region name [None] : ap-northeast-2(서울)
  Default output format [None] : json
  
  // 등록 확인
  aws configure list
  
  // 여러 AWS 계정과 아이디로 운용할 경우
  aws configure --profile [원하는 이름]
  ```

### Terraform install (Ubuntu)
  ``` bash
  wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
  echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
  sudo apt update && sudo apt install terraform

  $ terraform version
  ```
### Terraform install (Windows)
  ``` bash
  https://developer.hashicorp.com/terraform/install?product_intent=terraform
  다운로드 후 시스템 환경 변수 등록.

  >> terraform version
  ```

### Terraform Apply(실행)
  ``` bash
  // AWS 서비스 실행
  >> terraform init

  >> terraform apply 또는 terraform apply --auto-approve
  ****--auto-approve 옵션 넣을 시 "Enter a value: yes" 없이 다이렉트로 진행****

  Do you want to perform these actions?
    Terraform will perform the actions described above.
    Only 'yes' will be accepted to approve.
  
    Enter a value: yes
  
  aws_db_parameter_group.three_rds_parameter: Creating...
  aws_eip.three_tier_eip: Creating...
  aws_vpc.three_tier_vpc: Creating...
  aws_eip.three_tier_eip: Creation complete after 1s [id=eipalloc-0476********62f52]
  aws_vpc.three_tier_vpc: Creation complete after 1s [id=vpc-046c4********5ed38]
  aws_internet_gateway.three_tier_GateWay: Creating...
  .
  .
  .
  .
  aws_db_instance.three_rds: Still creating... [6m20s elapsed]
  aws_db_instance.three_rds: Still creating... [6m30s elapsed]
  aws_db_instance.three_rds: Creation complete after 6m40s [id=db-YX5ZZ4M***********OADYXQ4]
  
  Apply complete! Resources: 28 added, 0 changed, 0 destroyed.
  
  Outputs: (Example)
  
  was_instance_id = "i-07f5xxxxxxxxxxx865"
  was_instance_private_ip = "10.0.x.xx"
  web_instance_eip = "43.xxx.xxx.187"
  web_instance_id = "i-0cxxxxxxxxx7e9"
  ```

### 리소스 확인 및 웹 페이지 확인
![Nginx_Web_Page](https://github.com/dongkoony/aws_3_tier/assets/109497684/2444a9d0-292b-4375-a4db-ee907aec4fae)
  ```bash
  실행 후 프롬프트 Outputs: web_instance_eip = "43.xxx.xxx.187" Web Page 접속 확인.
  AWS 리소스 확인
  ```

### Terraform Destroy(리소스 삭제)
  ```bash
  // AWS 서비스(리소스) 삭제
  >> terraform destroy / terraform destroy --auto-approve
  ****--auto-approve 옵션 넣을 시 "Enter a value: yes" 없이 다이렉트로 진행****

  Do you really want to destroy all resources?
    Terraform will destroy all your managed infrastructure, as shown above.
    There is no undo. Only 'yes' will be accepted to confirm.
  
    Enter a value: yes
  
  aws_route_table_association.pub_c_assoc: Destroying... [id=rtbassoc-087353******bc1a9]
  aws_eip.web_eip: Destroying... [id=eipalloc-0d04626******192f]
  aws_route_table_association.rds_a_assoc: Destroying... [id=rtbassoc-001e0b******a3972]
  aws_route_table_association.pub_sub_route: Destroying... [id=rtbassoc-07a4******c73f216]
  aws_route_table_association.rds_c_assoc: Destroying... [id=rtbassoc-02f2c3******d535e]
  aws_route_table_association.pri_c_assoc: Destroying... [id=rtbassoc-093e6c******3d9c6]
  .
  .
  .
  .
  aws_subnet.Pri_subnet_A: Destruction complete after 0s
  aws_vpc.three_tier_vpc: Destroying... [id=vpc-046c4f******d38]
  aws_vpc.three_tier_vpc: Destruction complete after 1s
  
  Destroy complete! Resources: 28 destroyed.
  ```

### AWS 서비스(리소스) 삭제 확인
  ```bash
  EC2, EIP, RDS, VPC 등등 삭제 여부 확인
  ```
