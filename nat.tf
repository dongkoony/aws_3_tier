# EIP (Elastic IP) Settings

resource "aws_eip" "three_tier_eip" {
    domain = "vpc"

    tags = {
        Name = "three-tier-eip"
    }
}

# NAT Gateway Settings

resource "aws_nat_gateway" "three_tier_nat" {
    allocation_id = aws_eip.three_tier_eip.id
    subnet_id = aws_subnet.Pri_subnet_A.id

    tags = {
        Name = "three-tier-nat"
    }
} 