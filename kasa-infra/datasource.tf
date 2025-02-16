-----------------------------------------------------------------------------------------------------------
Datasources
-----------------------------------------------------------------------------------------------------------

Retrieve the account alias and company name stored by AFT - Use when neeeded
data "aws_ssm_parameter" "main" {
  for_each = toset(["account_alias", "company_name", "company_domain"])

  name = "/aft/account-request/custom-fields/${each.key}"
}

Retrieve the current AWS account ID - Use if neeeded
data "aws_caller_identity" "current" {}

Retrieve the current AWS region - Use if neeeded
data "aws_region" "current" {}

Retrieve the Availability Zones for the current region - Use if neeeded
data "aws_availability_zones" "available" {}
