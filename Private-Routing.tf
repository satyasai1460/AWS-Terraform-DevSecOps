resource "aws_route_table" "terraform-private-RT" {
  vpc_id = aws_vpc.default.id


  tags = {
    Name              = "${var.vpc_name}-Private-RT"
    Terraform_Managed = "Yes"
    environment       = local.new_environment
    projectId         = local.projectId
  }
}

resource "aws_route_table_association" "terraform-private-RT-association" {
  # count             = 4
  count          = length(local.new_private-Subnet-cidrs)
  subnet_id      = element(aws_subnet.private-subnets.*.id, count.index)
  route_table_id = aws_route_table.terraform-private-RT.id

}