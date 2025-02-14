terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  backend "s3" {
    bucket         = "kasa-terraform-state-bucket"
    region         = "us-east-1"
    dynamodb_table = "kasa-terraform-state-lock"
    encrypt        = true
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region = var.aws_region
}

