# Public Subnet ADD

resource "aws_subnet" "Pub_subnet_A" {
	vpc_id = aws_vpc.three_tier_vpc.id
	cidr_block = "10.0.0.0/24"
	availability_zone = "ap-northeast-2a" # 가용 영역 A

	tags = {
		Name = "Pub_subnet_A"
	}
}

resource "aws_subnet" "Pub_subnet_C" {
	vpc_id = aws_vpc.three_tier_vpc.id
	cidr_block = "10.0.1.0/24"
	availability_zone = "ap-northeast-2c" # 가용 영역 C

	tags = {
		Name = "Pub_subnet_C"
	}
}

resource "aws_subnet" "Pri_subnet_A" {
	vpc_id = aws_vpc.three_tier_vpc.id
	cidr_block = "10.0.2.0/24"
	availability_zone = "ap-northeast-2a" # 가용 영역 A

	tags = {
		Name = "Pri_subnet_A"
	}
}

resource "aws_subnet" "Pri_subnet_C" {
	vpc_id = aws_vpc.three_tier_vpc.id
	cidr_block = "10.0.3.0/24"
	availability_zone = "ap-northeast-2c" # 가용 영역 C

	tags = {
		Name = "Pri_subnet_C"
	}
}

resource "aws_subnet" "RDS_Subnet_A" {
	vpc_id = aws_vpc.three_tier_vpc.id
	cidr_block = "10.0.4.0/24"
	availability_zone = "ap-northeast-2a" # 가용 영역 A

	tags = {
		Name = "RDS_Subnet_A"
	}
}

resource "aws_subnet" "RDS_SUbnet_C" {
	vpc_id = aws_vpc.three_tier_vpc.id
	cidr_block = "10.0.5.0/24"
	availability_zone = "ap-northeast-2c" # 가용 영역 C

	tags = {
		Name = "RDS_Subnet_C"
	}
}