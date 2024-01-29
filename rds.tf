# RDS 파라미터 그룹 생성

resource "aws_db_parameter_group" "three_rds_parameter" {
    name = "three-rds-parameter"
    family = "mysql8.0" # db 엔진 종류

    parameter {
        name = "character_set_server"
        value = "UTF8MB4" # 모든 유니코드 인코딩 (특수 문자 및 이모티콘 포함)
    }

    lifecycle {
        create_before_destroy = true #true=>새 리소스가 성공적으로 생성되었을 때만 기존 리소스가 삭제 (안전한 업데이트 보장)
    }
}

# RDS Instance ADD

resource "aws_db_instance" "three_rds" {
    identifier = "db-three-rds" # db instance 이름 하이픈(-)만 허용 언더바(_) 허용 안 됨.
    engine = "mysql" # rds instance 엔진 종류
    engine_version = "8.0" # mysql version
    instance_class = "db.t3.micro" # db instance 타입
    allocated_storage = 30 # rds instance 스토리지 크기(GB)
    storage_type = "gp2" # rds instance 스토리지 타입
    storage_encrypted = false # rds instance 스토리지 암호화 여부
    username = "threerds" # rds instance 계정 이름
    password = "admin1234!!" # rds instance 계정 비밀번호
    parameter_group_name = aws_db_parameter_group.three_rds_parameter.name # rds instance 파라미터 그룹 이름
    skip_final_snapshot = true # rds instance 종료 시 스냅샷 생성 여부
    multi_az = false # rds instance 복제 여부
    publicly_accessible = false # rds instance 공개 여부
    vpc_security_group_ids = [aws_security_group.rds_nsg.id] # rds instance 접근 가능한 security group 리스트
    db_subnet_group_name = aws_db_subnet_group.RDS_Subnet_Gorup.name # db 인스턴스가 속한 서브넷 그룹 이름
    allow_major_version_upgrade = false # 주요 버전 업그레이드 허용하지 않음.(false)
    auto_minor_version_upgrade = true # 자동 부 버전 업그레이드 활성화(true)
    apply_immediately = true # 변경 사항 즉시 적용(true)
    maintenance_window = "Mon:00:00-Mon:03:00" # db instance 매주 월요일 00:00 부터 03:00까지 유지관리 수행.
    backup_window = "03:00-06:00" # db 백업 03:00부터 06:00까지 백업 수행
    backup_retention_period = 7 #데이터 백업 보존 기간 "7일"

    tags = {
        Name = "db_three-rds"
    }

    depends_on = [ aws_db_parameter_group.three_rds_parameter ] # 생성 순서 지정(파라미터 그룹 생성 먼저)
}