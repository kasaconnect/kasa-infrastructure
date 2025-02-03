# ---------------------------------------------------------------------------------------------
# AWS Backup
# ---------------------------------------------------------------------------------------------

# Backup Vault
resource "aws_backup_vault" "main" {
  name        = "${var.name}-vault"
  kms_key_arn = var.kms_key_arn
}

# Backup Vault Lock Configuration
# Setting the compliance mode only for the Shared Services centralized vault.
resource "aws_backup_vault_lock_configuration" "main" {
  count             = var.target_vault.arn == null ? 1 : 0
  backup_vault_name = aws_backup_vault.main.name
}

# Backup Plan
resource "aws_backup_plan" "main" {
  name = "${var.name}-plan"

  dynamic "rule" {
    for_each = var.rules

    content {
      schedule                 = rule.value.schedule
      rule_name                = "${var.name}-${rule.value.name}-rule"
      target_vault_name        = aws_backup_vault.main.name
      enable_continuous_backup = false

      recovery_point_tags = {
        rule = rule.value.name
      }
  
      # Set the start window for backup.
      start_window = 60
      # Set the completion window for backup,
      # which is the duration in minutes (480 minutes = 8 hours).
      completion_window = 480

      lifecycle {
        cold_storage_after = rule.value.cold_storage_after
        delete_after       = rule.value.delete_after
      }

      # Copying items from account backup vault to centralized Shared-Services backup vault
      dynamic "copy_action" {
        for_each = var.target_vault.arn == null ? [] : [var.target_vault.arn]

        content {
          destination_vault_arn = copy_action.value

          lifecycle {
            delete_after       = 60
          }
        }
      }
    }
  }
}

# Backup resources to be included
resource "aws_backup_selection" "main" {
  iam_role_arn  = aws_iam_role.main.arn
  name          = "${var.name}-resources"
  plan_id       = aws_backup_plan.main.id
  resources     = var.resources
  not_resources = var.not_resources

  condition {
    dynamic "string_equals" {
      for_each = var.tags_condition

      content {
        key   = "aws:ResourceTag/${string_equals.key}"
        value = string_equals.value
      }
    }
  }
}

# Backup Vault policy for both Shared-Services and source backup accounts
resource "aws_backup_vault_policy" "main" {
  backup_vault_name = aws_backup_vault.main.name
  policy            = data.aws_iam_policy_document.copy.json
}

# Backup services with the opt-in preferences for the Region.
resource "aws_backup_region_settings" "main" {
  resource_type_opt_in_preference = {
    "Aurora"                 = true
    "CloudFormation"         = false
    "DocumentDB"             = false
    "DynamoDB"               = true
    "EBS"                    = true
    "EC2"                    = true
    "EFS"                    = true
    "FSx"                    = false
    "Neptune"                = false
    "RDS"                    = true
    "Redshift"               = true
    "S3"                     = true
    "Storage Gateway"        = false
    "VirtualMachine"         = false
    "SAP HANA on Amazon EC2" = false
    "Timestream"             = false
  }

  resource_type_management_preference = {
    "DynamoDB" = true
    "EFS"      = true
  }
}

# Storing the Backup Vault ARN in SSM parameter store
resource "aws_ssm_parameter" "main" {
  name  = "/backup/vault"
  type  = "String"
  value = aws_backup_vault.main.arn
}
