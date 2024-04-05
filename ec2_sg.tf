# Web 보안 그룹 생성

resource "aws_security_group" "web_nsg" {
    name = "web_nsg"
    description = "Web Server Security Group"
    vpc_id = aws_vpc.three_tier_vpc.id

    #인바운드 규칙 SKB(SK인터넷) 사용자 SSH 임시 접속 포트 설정 (Port: 11117)
    ingress {
        from_port = var.web_ingress_from_port_sk # 11117
        to_port = var.web_ingress_to_port_sk     # 11117
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Custom SSH access port for SKB internet users"
    }

    #인바운드 규칙 기존 SSH 포트 설정 (Port: 22)
    ingress {
        from_port = var.web_ingress_from_port # 22
        to_port = var.web_ingress_to_port     # 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    # 인바운드 http(nginx) 웹 서버(미들웨어) Port
    ingress {
        from_port = var.web_ingress_http_from_port
        to_port = var.web_ingress_http_to_port
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    #아웃바운드 규칙 : all traffic agree
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
        tags = {
        Name = "web_nsg"
    }
}

# WAS 보안 그룹 ADD
resource "aws_security_group" "was_nsg" {
    name = "aws_nsg"
    description = "Web_Server_Security_Group_app_servers" 
    vpc_id = aws_vpc.three_tier_vpc.id

    # 인바운드 규칙 : 
    ingress {
        from_port = var.was_ingress_from_port
        to_port = var.was_ingress_to_port
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    # 아웃바운드 규칙 : all traffic agree
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = { 
        Name = "was_nsg"
    }
}  