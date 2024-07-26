aws_region = "us-east-1"
# aws_region_2        = "us-east-2"
vpc_cidr             = "10.35.0.0/16"
vpc_name             = "devsecopsb35"
key_name             = "2AWSB46-KP"
public-Subnet-cidrs  = ["10.35.1.0/24", "10.35.2.0/24", "10.35.3.0/24", "10.35.4.0/24", "10.35.5.0/24", "10.35.1.0/24", "10.35.2.0/24", "10.35.3.0/24", "10.35.4.0/24", "10.35.5.0/24"]
private-Subnet-cidrs = ["10.35.10.0/24", "10.35.20.0/24", "10.35.30.0/24", "10.35.40.0/24", "10.35.50.0/24", "10.35.10.0/24", "10.35.20.0/24", "10.35.30.0/24", "10.35.40.0/24", "10.35.50.0/24"]
azs                  = ["us-east-1a", "us-east-1b", "us-east-1c"]
environment          = "DEVELOPMENT"
projectId            = "PHEONIX-123"
imagename            = "ami-0261755bbcb8c4a84"
instance_type = {
  development = "t2.large"
  testing     = "t2.small"
  production  = "t2.micro"
}
amis = {
  us-east-1 = "ami-0261755bbcb8c4a84" # ubuntu 22.04 LTS
  us-east-2 = "ami-0b8b44ec9a8f90422" # ubuntu 22.04 LTS
}
