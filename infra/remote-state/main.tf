terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}


provider "aws" {
  profile = "default"
  region = "eu-north-1"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "hr-tfstate"
  acl    = "private"
}
