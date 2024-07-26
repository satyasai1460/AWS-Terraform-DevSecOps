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
    key    = "functions.tfstate"
    region = "us-east-1"

    # Replace this with your DynamoDB table name!
    dynamodb_table = "devsecopsb36-state-locking"
    encrypt        = true
  }
}