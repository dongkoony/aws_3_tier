# WEB EC2 Instance ADD

resource "aws_instance" "Web_server" {
    ami = "ami-0f3a440bbcff3d043" #ubuntu 22.04 LTS 64(x86)
    instance_type = "t2.micro" # instance type
    key_name = "three_tier_study" #기존 사용하는 Key_Pair 사용. 
    subnet_id = aws_subnet.Pub_subnet_A.id
    vpc_security_group_ids = [aws_security_group.web_nsg.id]

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

