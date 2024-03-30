provider "aws" {
}

terraform {
  required_version = "<= 1.6.2" #Forcing which version of Terraform needs to be used
  required_providers {
    aws = {
      version = "<= 5.0.0" #Forcing which version of plugin needs to be used.
      source  = "hashicorp/aws"
    }
  }
  backend "s3" {
    # Replace this with your bucket name!
    bucket = "devsecopsb36-tfstate"
    key    = "global/s3/terraform.tfstate"
    region = "us-east-2"

    # Replace this with your DynamoDB table name!
    dynamodb_table = "devsecopsb35-state-locking"
    encrypt        = true
  }
}