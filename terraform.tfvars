# "budget.tf" Slack 알람 웹훅 URL (채널 URL) 
slack_webhook_url = "<SLACK_WEBHOOK_URL>"

# "ec2_sg.tf"
web_ingress_from_port_sk = 11117
web_ingress_to_port_sk   = 11117

web_ingress_from_port = 22
web_ingress_to_port = 22

web_ingress_http_from_port = 80
web_ingress_http_to_port = 80

was_ingress_from_port = 8080
was_ingress_to_port   = 8080

# "ec2.tf"
# Web EC2 Instance 변수
web_instance_ami = "ami-09a7535106fbd42d5" # 예: Ubuntu 22.04 LTS 64(x86)
web_instance_type = "t2.micro"
web_instance_key_name = "3-tier-test" # 예: my_key_pair
web_instance_name = "Web_Server"

# WAS EC2 Instance 변수
was_instance_ami = "ami-09a7535106fbd42d5" # 예: Ubuntu 22.04 LTS 64(x86)
was_instance_type = "t2.micro"
was_instance_key_name = "3-tier-test" # 예: my_key_pair
was_instance_name = "WAS_Server"

# WEB Instance Elastic IP 변수
web_eip_name = "Web_Server_EIP"

# "nat.tf"
# EIP (Elastic IP) 설정 변수
eip_domain = "vpc"

# NAT Gateway 설정 변수
nat_subnet_id = "<SUBNET_ID>" # 예: aws_subnet.my_subnet.id

# "provider.tf"
# 리전 설정 변수
region = "ap-northeast-2"

# 테라폼 버전 설정 변수
terraform_version = ">= 0.12"

# "rds_sg.tf"
# RDS Security Group 설정 변수
rds_sg_name = "rds_sg"
rds_sg_description = "Security group for RDS Instance"
rds_sg_ingress_port = 3306
rds_sg_ingress_protocol = "tcp"

# "rds_sub_group.tf"
rds_subnet_group_name = "rds_subnet_group"

# "rds.tf"
# RDS Parameter Group 변수 설정
rds_parameter_group_name = "my-rds-parameter"
rds_parameter_family = "mysql8.0" # DB 엔진 종류
rds_parameter_character_set_server = "utf8mb4" # 인코딩 설정

# RDS Instance 변수 설정
rds_instance_identifier = "my-db-instance" # DB 인스턴스 이름
rds_instance_engine = "mysql" # DB 인스턴스 엔진 종류
rds_instance_engine_version = "8.0" # MySQL 버전
rds_instance_class = "db.t3.micro" # DB 인스턴스 타입
rds_instance_allocated_storage = 20 # DB 인스턴스 스토리지 크기(GB)
rds_instance_storage_type = "gp2" # DB 인스턴스 스토리지 타입
rds_instance_storage_encrypted = false # DB 인스턴스 스토리지 암호화 여부
rds_instance_username = "admin" # DB 인스턴스 계정 이름
rds_instance_password = "admin1234!@#" # DB 인스턴스 계정 비밀번호
rds_instance_skip_final_snapshot = true # DB 인스턴스 종료 시 스냅샷 생성 여부
rds_instance_multi_az = false # DB 인스턴스 복제 여부
rds_instance_publicly_accessible = false # DB 인스턴스 공개 여부
rds_instance_allow_major_version_upgrade = false # 주요 버전 업그레이드 허용 여부
rds_instance_auto_minor_version_upgrade = true # 자동 부 버전 업그레이드 활성화 여부
rds_instance_apply_immediately = true # 변경 사항 즉시 적용 여부
rds_instance_maintenance_window = "Mon:00:00-Mon:03:00" # DB 인스턴스 유지 관리 시간
rds_instance_backup_window = "03:00-06:00" # DB 백업 시간
rds_instance_backup_retention_period = 7 # DB 데이터 백업 보존 기간(일)

# "route.tf"
# Public Route Table 변수 설정
pub_route_table_name = "Public_Route_Table"
pub_route_cidr_block = "0.0.0.0/0"

# Private Route Table 변수 설정
pri_route_table_name = "Private_Route_Table"
pri_route_cidr_block = "0.0.0.0/0"

# RDS Route Table 변수 설정
rds_route_table_name = "RDS_Route_Table"

# "budget.tf"
budget_limit_amount = "10"
budget_email_address = "shin.dh922@gmail.com"
budget_subscription_type = "EMAIL" #대문자로만 사용 가능