# -----------------------------------------------------------------------------------------------------------
# SSM Parameters
# -----------------------------------------------------------------------------------------------------------

module "ssm" {
  source   = "../modules/ssm"
  for_each = var.ssm

  name        = "/kasa-sus/${data.aws_ssm_parameter.main["account_alias"].value}/${each.key}"
  description = "kasa sus parameters for ${data.aws_ssm_parameter.main["account_alias"].value}"
  type        = each.value == "{PLACEHOLDER}" ? "SecureString" : "String"
  value       = each.value
}