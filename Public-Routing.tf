resource "aws_route_table" "terraform-public" {
  vpc_id = aws_vpc.default.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.default.id
  }

  tags = {
    Name              = "${var.vpc_name}-Main-RT"
    Terraform_Managed = "Yes"
    environment       = local.new_environment
    projectId         = local.projectId
  }
}

resource "aws_route_table_association" "terraform-public" {
  # count             = 4
  count          = length(local.new_public-Subnet-cidrs)
  subnet_id      = element(aws_subnet.Public-subnets.*.id, count.index)
  route_table_id = aws_route_table.terraform-public.id

}

# resource "aws_route_table_association" "terraform-public2" {
#   subnet_id      = aws_subnet.subnet2-public.id
#   route_table_id = aws_route_table.terraform-public.id
# }

# resource "aws_route_table_association" "terraform-public3" {
#   subnet_id      = aws_subnet.subnet3-public.id
#   route_table_id = aws_route_table.terraform-public.id
# }