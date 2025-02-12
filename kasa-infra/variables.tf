variable "aws_region" {
  description = "The AWS region to create resources in"
  type        = string
}

variable "ami" {
  description = "The AMI ID for the instance"
  type        = string
}

variable "instance_type" {
  description = "The instance type for the server"
  type        = string
}

#