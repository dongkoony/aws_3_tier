# Public Route Table ADD

resource "aws_route_table" "pub_route" {
    vpc_id = aws_vpc.three_tier_vpc.id

    route {
        cidr_block = var.pub_route_cidr_block
        gateway_id = aws_internet_gateway.three_tier_GateWay.id
    }

    tags = {
        Name = var.pub_route_table_name
    }
}

# Public 서브넷 > Public Route Table 연결

resource "aws_route_table_association" "pub_sub_route" {
    subnet_id = aws_subnet.Pub_subnet_A.id
    route_table_id = aws_route_table.pub_route.id
}


resource "aws_route_table_association" "pub_c_assoc" {
    subnet_id = aws_subnet.Pub_subnet_C.id
    route_table_id = aws_route_table.pub_route.id
}


# Privete Route Table ADD
resource "aws_route_table" "pri_route" {
    vpc_id = aws_vpc.three_tier_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.three_tier_nat.id
    }

    tags = {
        Name = "Private Route Table"
    }
}


# Private 서브넷 > Private Route Table 연결
resource "aws_route_table_association" "pri_a_assoc" {
    subnet_id = aws_subnet.Pri_subnet_A.id
    route_table_id = aws_route_table.pri_route.id
}

resource "aws_route_table_association" "pri_c_assoc" {
    subnet_id = aws_subnet.Pri_subnet_C.id
    route_table_id = aws_route_table.pri_route.id
}

# RDS Route Table ADD
resource "aws_route_table" "rds_route" {
    vpc_id = aws_vpc.three_tier_vpc.id

    ###### 특정 라우팅 테이블 규칙 추가 필요 시 여기에 정의 ######

    tags = {
        Name = "RDS Route Table"
    }
}

# RDS 서브넷 > RDS Route Table 연결
resource "aws_route_table_association" "rds_a_assoc" {
    subnet_id = aws_subnet.RDS_Subnet_A.id
    route_table_id = aws_route_table.rds_route.id
}

resource "aws_route_table_association" "rds_c_assoc"{
    subnet_id = aws_subnet.RDS_SUbnet_C.id
    route_table_id = aws_route_table.rds_route.id
}