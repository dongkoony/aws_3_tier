# Internet GateWay ADD

resource "aws_internet_gateway" "three_tier_GateWay" {
    vpc_id = aws_vpc.three_tier_vpc.id

    tags = {
        Name = "3-tier-igw"
    }
}