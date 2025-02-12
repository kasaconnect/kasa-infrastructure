terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  backend "s3" {
    bucket         = "kasa-test-bucket"
    region         = "us-east-1"
    dynamodb_table = "demotf-locking"
    encrypt        = true
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region = var.aws_region
}
