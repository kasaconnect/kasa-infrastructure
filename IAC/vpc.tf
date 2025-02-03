# -----------------------------------------------------------------------------------------------------------
# VPC configuration
# -----------------------------------------------------------------------------------------------------------

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.12.0"

  # Names and CIDR ranges
  name = "${data.aws_ssm_parameter.main["account_alias"].value}-vpc"
  cidr = var.vpc.vpc_cidr

  # Availability Zones
  azs = slice(data.aws_availability_zones.available.names, 0, 3)

  # Subnets
  public_subnets      = var.vpc.public_subnets
  private_subnets     = var.vpc.private_subnets
  database_subnets    = var.vpc.database_subnets
  elasticache_subnets = var.vpc.elasticache_subnets

  # Additional settings
  enable_nat_gateway = true
  single_nat_gateway = true
}
