output "VPC_id" {
  value = aws_vpc.default.id
}

# output "Subnet1_id" {
#   value = aws_subnet.subnet1-public.id
# }


output "Subenet_id" {
  value = aws_subnet.Public-subnets.*.id
}

output "VPC_owner_id" {
  value = aws_vpc.default.owner_id
}

output "SG_id" {
  value = aws_security_group.allow_all.id
}