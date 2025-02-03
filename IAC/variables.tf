# -----------------------------------------------------------------------------------------------------------
# Account definition variables
# -----------------------------------------------------------------------------------------------------------

variable "region" {
  description = "The AWS region"
  type        = string
}

variable "account_id" {
  description = "The AWS Account ID"
  type        = string
}

variable "vpc" {
  description = "VPC Configuration including public, private, database, and elasticache subnets"
  type = object({
    public_subnets      = list(string)
    private_subnets     = list(string)
    database_subnets    = list(string)
    elasticache_subnets = list(string)
  })
}
