# RDS Subnet Group(서브넷 그룹) ADD

resource "aws_db_subnet_group" "RDS_Subnet_Gorup" {
    name = "rds_subnet_gorup"
    subnet_ids = [aws_subnet.RDS_Subnet_A.id, aws_subnet.RDS_SUbnet_C.id]

    tags = {
        Name = "RDS_Subnet_Gorup"
    }  
}