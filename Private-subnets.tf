resource "aws_subnet" "private-subnets" {
  # count             = 4
  count             = length(local.new_private-Subnet-cidrs)
  vpc_id            = aws_vpc.default.id
  cidr_block        = element(local.new_private-Subnet-cidrs, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name              = "${var.vpc_name}-PrivateSubnet-${count.index + 1}"
    Terraform_Managed = "Yes"
    environment       = local.new_environment
    projectId         = local.projectId
  }
}