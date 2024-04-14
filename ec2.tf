# WEB EC2 Instance ADD

resource "aws_instance" "Web_server" {
    ami = var.web_instance_ami # Ubuntu 22.04 LTS 64(x86)
    instance_type = var.web_instance_type # 인스턴스 타입
    key_name = var.web_instance_key_name # 기존 사용 중인 Key Pair 사용
    subnet_id = aws_subnet.Pub_subnet_A.id
    vpc_security_group_ids = [aws_security_group.web_nsg.id]


    # Web Server Nginx 설치 코드
# Web Server Nginx 설치 코드
    user_data = <<-EOF
        ${file("script/nginx.sh")}
                EOF


    tags = {
        Name = var.web_instance_name # 인스턴스 이름 설정
    }
}

# WAS EC2 Instance ADD

resource "aws_instance" "Was_Server" {
    ami = var.was_instance_ami #ubuntu 22.04 LTS 64(x86)
    instance_type = var.was_instance_type # instance type
    key_name = var.was_instance_key_name #기존 사용하는 Key_Pair 사용. 
    subnet_id = aws_subnet.Pri_subnet_A.id

    tags = {
        Name = var.was_instance_name # 인스턴스 이름 설정
    }
}

# CI/CD 도구로 젠킨스(EC2) 추가
resource "aws_instance" "Jenkins_Server" {
    ami                    = var.jenkins_instance_ami # 젠킨스 AMI
    instance_type          = var.jenkins_instance_type # 젠킨스 인스턴스 타입
    key_name               = var.jenkins_instance_key_name # 젠킨스 키페어
    subnet_id              = aws_subnet.Pub_subnet_C.id

    tags = {
        Name = var.jenkins_instance_name # 인스턴스 이름 설정
    }

    # User data에 젠킨스 스크립트 추가
    user_data = <<-EOF
        ${file("script/docker.sh")}
        ${file("script/container.sh")}
    EOF
}

# WEB Instance Elastic IP ADD

resource "aws_eip" "web_eip" {
    instance = aws_instance.Web_server.id

    tags = {
        Name = var.web_eip_name # EIP 태그 이름 설정
    }
}
