# AWS VPC ADD

resource "aws_vpc" "three_tier_vpc" {
    cidr_block = "10.0.0.0/16"

    tags = {
        Name = "3-tier-vpc"
    }
}