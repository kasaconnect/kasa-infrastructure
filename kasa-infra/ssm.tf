# -----------------------------------------------------------------------------------------------------------
# SSM Parameters
# -----------------------------------------------------------------------------------------------------------

# Declare the missing data source for AWS SSM Parameter Store
data "aws_ssm_parameter" "main" {
  name = "/account-alias" # Ensure this is the correct parameter path in AWS SSM
}

module "ssm" {
  source   = "../modules/ssm"
  for_each = var.ssm

  name        = "/app-runner/${data.aws_ssm_parameter.main.value}/${each.key}"
  description = "App Runner parameters for ${data.aws_ssm_parameter.main.value}"
  type        = each.value == "{PLACEHOLDER}" ? "SecureString" : "String"
  value       = each.value
}
