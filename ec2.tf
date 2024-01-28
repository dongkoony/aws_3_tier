# WEB EC2 Instance ADD

resource "aws_instance" "Web_server" {
    ami = "ami-0f3a440bbcff3d043" # Ubuntu 22.04 LTS 64(x86)
    instance_type = "t2.micro" # 인스턴스 타입
    key_name = "three_tier_study" # 기존 사용 중인 Key Pair 사용
    subnet_id = aws_subnet.Pub_subnet_A.id
    vpc_security_group_ids = [aws_security_group.web_nsg.id]


    # Web Server Nginx 설치 코드
    user_data = <<-EOF
                #!/bin/bash
                sudo apt-get update -y
                sudo apt-get install nginx -y

                # Web Page Message 작성
                echo "<html><body>" > /var/www/html/index.html
                echo "<h1>Welcome to Donghyeon's AWS 3-tier Terraform Study</h1>" >> /var/www/html/index.html
                echo "<p>This is a custom welcome message.</p>" >> /var/www/html/index.html
                echo "</body></html>" >> /var/www/html/index.html

                sudo systemctl enable --now nginx
                EOF

    tags = {
        Name = "Web_Server"
    }
}


# WEB Instance Elastic IP ADD

resource "aws_eip" "web_eip" {
    instance = aws_instance.Web_server.id

    tags = {
        Name = "Web_Server_EIP"
    }
}

# WAS EC2 Instance ADD

resource "aws_instance" "Was_Server" {
    ami = "ami-0f3a440bbcff3d043" #ubuntu 22.04 LTS 64(x86)
    instance_type = "t2.micro" # instance type
    key_name = "three_tier_study" #기존 사용하는 Key_Pair 사용. 
    subnet_id = aws_subnet.Pri_subnet_A.id

    tags = {
        Name = "WAS_Server"
    }
}

