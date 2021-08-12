terraform {
  backend "s3" {
    bucket = "hr-tfstate"
    region = "eu-north-1"
  }

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
  region  = "eu-north-1"
}

resource "aws_dynamodb_table" "workout-table" {
  name           = "WorkOut"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "EventId"
  range_key      = "TimeStamp"

  attribute {
    name = "EventId"
    type = "S"
  }

  attribute {
    name = "TimeStamp"
    type = "S"
  }

  tags = {
    Name        = "dynamodb-table-1"
    Environment = "production"
  }
}
