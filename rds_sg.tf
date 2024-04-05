# AWS RDS Security Group(보안 그룹) ADD

resource "aws_security_group" "rds_nsg" {
    name = "rds_nsg"
    description = "Security group for RDS Instance"
    vpc_id = aws_vpc.three_tier_vpc.id

# 인바운드 규칙 -> Private 서브넷 CIDR 블록에서 3306 Port 접근 허용
    ingress {
        from_port = var.rds_sg_ingress_port
        to_port = var.rds_sg_ingress_port
        protocol = var.rds_sg_ingress_protocol
        cidr_blocks = [aws_subnet.Pri_subnet_A.cidr_block, aws_subnet.Pri_subnet_C.cidr_block]
    }


# 아웃바운드 규칙 : 모든 트래픽 허용
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "rds_nsg"
    }
}