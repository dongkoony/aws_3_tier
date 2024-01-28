# Web 보안 그룹 생성

resource "aws_security_group" "web_nsg" {
    name = "web_nsg"
    description = "Web Server Security Group"
    vpc_id = aws_vpc.three_tier_vpc.id

    #인바운드 규칙 : 22번 포트 열어줌, SKB 인터넷 사용시 11117 임시 포트 사용. ssh 22번 포트 사용 불가.
    ingress {
        from_port = 11117
        to_port = 11117
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }


    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    # 인바운드 http(nginx) 웹 서버(미들웨어) Port
    ingress {
        from_port = 80
        to_port = 80
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
        from_port = 8080
        to_port = 8080
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