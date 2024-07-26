resource "aws_vpc" "default" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name              = var.vpc_name
    Owner             = "Satya"
    environment       = local.new_environment
    Terraform_Managed = "Yes"
    projectId         = local.projectId
  }
}

resource "aws_internet_gateway" "default" {
  vpc_id = aws_vpc.default.id
  tags = {
    Name              = "${var.vpc_name}-IGW"
    Terraform_Managed = "Yes"
    environment       = local.new_environment
    projectId         = local.projectId
  }
}