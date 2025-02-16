variable "ami" {
  description = "The AMI ID for the instance"
  type        = string
}

variable "instance_type" {
  description = "The instance type for the server"
  type        = string
}

variable "region" {
  description = "The region where we deploy the resources"
  type        = string
}

variable "account_id" {
  description = "The account ID where we deploy our resources"
  type        = string
}
# ---------------------------------------------------------------------------------------------
# SSM Parameters
# ---------------------------------------------------------------------------------------------

variable "ssm" {
  description = "SSM Parameters"
  type        = any
}
