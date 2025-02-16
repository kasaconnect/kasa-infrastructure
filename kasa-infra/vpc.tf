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
  public_subnets   = var.vpc.public_subnets
  private_subnets  = var.vpc.private_subnets
#   database_subnets = var.vpc.database_subnets

  # Additional settings
  enable_nat_gateway = false
  single_nat_gateway = false
}
