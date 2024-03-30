output "VPC_id" {
  value = aws_vpc.default.id
}

output "Subnet1_id" {
  value = aws_subnet.subnet1-public.id
}

output "SG_id" {
  value = aws_security_group.allow_all.id
}