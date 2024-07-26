resource "aws_subnet" "Public-subnets" {
  # count             = 4
  count             = length(local.new_public-Subnet-cidrs)
  vpc_id            = aws_vpc.default.id
  cidr_block        = element(local.new_public-Subnet-cidrs, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name              = "${var.vpc_name}-PublicSubnet-${count.index + 1}"
    Terraform_Managed = "Yes"
    environment       = local.new_environment
    projectId         = local.projectId
  }
}

# resource "aws_subnet" "subnet-4-imported" {
#   vpc_id            = "vpc-0fe89bbbcccc883d1"
#   availability_zone = "us-east-1d"
#   cidr_block        = "10.35.4.0/24"

#   tags = {
#     "Name"              = "devsecopsb35-PublicSubnet-4"

#   }
# }