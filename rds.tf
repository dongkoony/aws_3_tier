# RDS 파라미터 그룹 생성

resource "aws_db_parameter_group" "three_rds_parameter" {
    name = var.rds_parameter_group_name
    family = var.rds_parameter_family # db 엔진 종류

    parameter {
        name = "character_set_server"
        value = var.rds_parameter_character_set_server # 모든 유니코드 인코딩 (특수 문자 및 이모티콘 포함)
    }

    lifecycle {
        create_before_destroy = true #true=>새 리소스가 성공적으로 생성되었을 때만 기존 리소스가 삭제 (안전한 업데이트 보장)
    }
}

# RDS Instance ADD

resource "aws_db_instance" "three_rds" {
    identifier = var.rds_instance_identifier # db instance 이름 하이픈(-)만 허용 언더바(_) 허용 안 됨.
    engine = var.rds_instance_engine # rds instance 엔진 종류
    engine_version = var.rds_instance_engine_version # mysql version
    instance_class = var.rds_instance_class # db instance 타입
    allocated_storage = var.rds_instance_allocated_storage # rds instance 스토리지 크기(GB)
    storage_type = var.rds_instance_storage_type # rds instance 스토리지 타입
    storage_encrypted = var.rds_instance_storage_encrypted # rds instance 스토리지 암호화 여부
    username = var.rds_instance_username # rds instance 계정 이름
    password = var.rds_instance_password # rds instance 계정 비밀번호
    parameter_group_name = aws_db_parameter_group.three_rds_parameter.name # rds instance 파라미터 그룹 이름
    skip_final_snapshot = var.rds_instance_skip_final_snapshot # rds instance 종료 시 스냅샷 생성 여부
    multi_az = var.rds_instance_multi_az # rds instance 복제 여부
    publicly_accessible = var.rds_instance_publicly_accessible # rds instance 공개 여부
    vpc_security_group_ids = [aws_security_group.rds_nsg.id] # rds instance 접근 가능한 security group 리스트
    db_subnet_group_name = aws_db_subnet_group.RDS_Subnet_Gorup.name # db 인스턴스가 속한 서브넷 그룹 이름
    allow_major_version_upgrade = var.rds_instance_allow_major_version_upgrade # 주요 버전 업그레이드 허용하지 않음.(false)
    auto_minor_version_upgrade = var.rds_instance_auto_minor_version_upgrade # 자동 부 버전 업그레이드 활성화(true)
    apply_immediately = var.rds_instance_apply_immediately # 변경 사항 즉시 적용(true)
    maintenance_window = var.rds_instance_maintenance_window # db instance 매주 월요일 00:00 부터 03:00까지 유지관리 수행.
    backup_window = var.rds_instance_backup_window # db 백업 03:00부터 06:00까지 백업 수행
    backup_retention_period = var.rds_instance_backup_retention_period #데이터 백업 보존 기간 "7일"

    tags = {
        Name = "db_three-rds"
    }

    depends_on = [ aws_db_parameter_group.three_rds_parameter ] # 생성 순서 지정(파라미터 그룹 생성 먼저)
}