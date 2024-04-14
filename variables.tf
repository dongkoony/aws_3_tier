# *budget.tf* 
# Slack 알람 웹훅 URL (채널 URL) 
variable "slack_webhook_url" {
    description = "Slack 웹훅 URL"
}

# "ec2_sg.tf"
variable "web_ingress_from_port_sk" {
    description = "웹 보안 그룹의 인바운드 규칙 시작 포트_SKB 인터넷 전용 포트"
    type        = number
}

variable "web_ingress_to_port_sk" {
    description = "웹 보안 그룹의 인바운드 규칙 종료 포트_SKB 인터넷 전용 포트"
    type        = number
}

variable "web_ingress_from_port" {
    description = "웹 보안 그룹의 인바운드 규칙 시작 포트"
    type        = number
}

variable "web_ingress_to_port" {
    description = "웹 보안 그룹의 인바운드 규칙 종료 포트"
    type        = number
}

variable "web_ingress_http_from_port" {
    description = "웹 보안 그룹 인바운드 http 포트"
    type        = number
}

variable "web_ingress_http_to_port" {
    description = "웹 보안 그룹 인바운드 http 포트"
    type        = number
}

variable "was_ingress_from_port" {
    description = "WAS 보안 그룹의 인바운드 규칙 시작 포트"
    type        = number
}

variable "was_ingress_to_port" {
    description = "WAS 보안 그룹의 인바운드 규칙 종료 포트"
    type        = number
}

variable "Jenkins_ingress_from_port" {
    description = "Jenkins 시작 포트"
    type        = number
}

variable "Jenkins_ingress_to_port" {
    description = "Jenkins 종료 포트"
    type        = number
}


# "ec2.tf"
# WEB EC2 인스턴스 변수
variable "web_instance_ami" {
    description = "Web EC2 인스턴스에 대한 AMI ID"
    type        = string
}

variable "web_instance_type" {
    description = "Web EC2 인스턴스의 인스턴스 유형"
    type        = string
}

variable "web_instance_key_name" {
    description = "Web EC2 인스턴스에 액세스하기 위한 키 이름"
    type        = string
}

variable "web_instance_name" {
    description = "Web EC2 인스턴스 Tags Name"
    type        = string
}

# WAS EC2 인스턴스 변수
variable "was_instance_ami" {
    description = "WAS EC2 인스턴스에 대한 AMI ID"
    type        = string
}

variable "was_instance_type" {
    description = "WAS EC2 인스턴스의 인스턴스 유형"
    type        = string
}

variable "was_instance_key_name" {
    description = "WAS EC2 인스턴스에 액세스하기 위한 키 이름"
    type        = string
}

variable "was_instance_name" {
    description = "Was EC2 인스턴스 Tags Name"
    type        = string
}

# WEB Instance Elastic IP 변수
variable "web_eip_name" {
    description = "Web 인스턴스 엘라스틱 IP Tags Name"
    type        = string
}

# Jenkins Server 변수
variable "jenkins_instance_ami" {
    description = "Jenkins Server AMI"
    type        = string
}

variable "jenkins_instance_type" {
    description = "Jenkins Server 유형"
    type        = string
}

variable "jenkins_instance_key_name" {
    description = "Jenkins Server 키페어"
    type        = string
}

variable "jenkins_instance_name" {
    description = "Jenkins Server Tags"
    type        = string
}

# "nat.tf"
# EIP (Elastic IP) 변수
variable "eip_domain" {
    description = "EIP의 도메인 설정 (기본적으로 'vpc' 사용)"
    type        = string
}

# NAT Gateway 변수
variable "nat_subnet_id" {
    description = "NAT 게이트웨이가 속한 서브넷의 ID"
    type        = string
}

# "provider.tf"
# 리전 설정 변수
variable "region" {
    description = "테라폼에서 사용할 AWS 리전"
    type        = string
}

# 테라폼 버전 설정 변수
variable "terraform_version" {
    description = "사용할 테라폼 버전"
    type        = string
}

# "rds_sg.tf"
variable "rds_sg_name" {
    description = "RDS 보안 그룹의 이름"
    type        = string
}

variable "rds_sg_description" {
    description = "RDS 보안 그룹의 설명"
    type        = string
}

variable "rds_sg_ingress_port" {
    description = "RDS 보안 그룹의 인바운드 포트"
    type        = number
}

variable "rds_sg_ingress_protocol" {
    description = "RDS 보안 그룹의 인바운드 프로토콜"
    type        = string
}


# "rds_sub_group.tf"
variable "rds_subnet_group_name" {
    description = "RDS 서브넷 그룹의 이름"
    type        = string
}


# "rds.tf"
# RDS Parameter Group 설정 변수
variable "rds_parameter_group_name" {
    description = "RDS 파라미터 그룹의 이름"
    type        = string
}

variable "rds_parameter_family" {
    description = "RDS 파라미터 그룹의 엔진 패밀리"
    type        = string
}

variable "rds_parameter_character_set_server" {
    description = "RDS 파라미터 그룹의 character_set_server 설정 값"
    type        = string
}


# RDS Instance 설정 변수
variable "rds_instance_identifier" {
    description = "RDS 인스턴스의 식별자"
    type        = string
}

variable "rds_instance_engine" {
    description = "RDS 인스턴스의 엔진"
    type        = string
}

variable "rds_instance_engine_version" {
    description = "RDS 인스턴스의 엔진 버전"
    type        = string
}

variable "rds_instance_class" {
    description = "RDS 인스턴스의 클래스"
    type        = string
}

variable "rds_instance_allocated_storage" {
    description = "RDS 인스턴스의 할당된 스토리지 크기 (GB)"
    type        = number
}

variable "rds_instance_storage_type" {
    description = "RDS 인스턴스의 스토리지 유형"
    type        = string
}

variable "rds_instance_storage_encrypted" {
    description = "RDS 인스턴스의 스토리지 암호화 여부"
    type        = bool
}

variable "rds_instance_username" {
    description = "RDS 인스턴스의 사용자 이름"
    type        = string
}

variable "rds_instance_password" {
    description = "RDS 인스턴스의 비밀번호"
    type        = string
}

variable "rds_instance_skip_final_snapshot" {
    description = "RDS 인스턴스 종료 시 최종 스냅샷 생성 여부"
    type        = bool
}

variable "rds_instance_multi_az" {
    description = "RDS 인스턴스의 다중 가용 영역 여부"
    type        = bool
}

variable "rds_instance_publicly_accessible" {
    description = "RDS 인스턴스의 공개적 접근 허용 여부"
    type        = bool
}

variable "rds_instance_allow_major_version_upgrade" {
    description = "RDS 인스턴스의 주요 버전 업그레이드 허용 여부"
    type        = bool
}

variable "rds_instance_auto_minor_version_upgrade" {
    description = "RDS 인스턴스의 자동 부 버전 업그레이드 활성화 여부"
    type        = bool
}

variable "rds_instance_apply_immediately" {
    description = "RDS 인스턴스의 변경 사항 즉시 적용 여부"
    type        = bool
}

variable "rds_instance_maintenance_window" {
    description = "RDS 인스턴스의 유지 보수 창"
    type        = string
}

variable "rds_instance_backup_window" {
    description = "RDS 인스턴스의 백업 창"
    type        = string
}

variable "rds_instance_backup_retention_period" {
    description = "RDS 인스턴스의 데이터 백업 보존 기간"
    type        = number
}

# "route.tf"
# Public Route Table 변수 설정
variable "pub_route_table_name" {
    description = "Public Route Table의 이름"
    type        = string
}

variable "pub_route_cidr_block" {
    description = "Public Route Table의 대상 CIDR 블록"
    type        = string
}

# Private Route Table 변수 설정
variable "pri_route_table_name" {
    description = "Private Route Table의 이름"
    type        = string
}

variable "pri_route_cidr_block" {
    description = "Private Route Table의 대상 CIDR 블록"
    type        = string
}

# RDS Route Table 변수 설정
variable "rds_route_table_name" {
    description = "RDS Route Table의 이름"
    type        = string
}

# "budget.tf"
variable "budget_limit_amount" {
    description = "EC2 월별 예산 USD"
    type        = number 
}

variable "budget_email_address" {
    description = "EC2 월별 예산 알림 이메일 주소"
    type        = string 
}

variable "budget_subscription_type" {
    description = "budget 알림 구독 타입"
    type        = string
}