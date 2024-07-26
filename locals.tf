locals {
  new_public-Subnet-cidrs  = distinct(var.public-Subnet-cidrs)
  new_private-Subnet-cidrs = distinct(var.private-Subnet-cidrs)
  new_environment          = lower(var.environment)
  projectId                = format("%s-%s", lower(var.vpc_name), lower(var.projectId))
}
