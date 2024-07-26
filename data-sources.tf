# data "aws_vpc" "AWSB46_VPC" {
#   id = "vpc-0c1c71606510ce51f"
# }

# resource "aws_subnet" "AWSB46_VPC-public-subnet4" {
#   vpc_id            = data.aws_vpc.AWSB46_VPC.id
#   cidr_block        = "10.46.4.0/24"
#   availability_zone = "us-east-1d"

#   tags = {
#     Name = "public-subnet-4"
#   }
# }

# resource "aws_subnet" "AWSB46_VPC-private-subnet4" {
#   vpc_id            = data.aws_vpc.AWSB46_VPC.id
#   cidr_block        = "10.46.40.0/24"
#   availability_zone = "us-east-1d"

#   tags = {
#     Name = "private-subnet-4"
#   }
# }