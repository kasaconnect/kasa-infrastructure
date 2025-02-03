# -----------------------------------------------------------------------------------------------------------
# AWS IAM Roles
# -----------------------------------------------------------------------------------------------------------

resource "aws_iam_role" "main" {
  name               = var.role_name
  description        = "Role for AWS Backup to copy resources into the backup vault"
  assume_role_policy = data.aws_iam_policy_document.backup.json
}

resource "aws_iam_role_policy_attachment" "backup_service_role_policy_for_backup" {
  role       = aws_iam_role.main.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForBackup"
}

resource "aws_iam_role_policy_attachment" "backup_service_role_policy_for_restores" {
  role       = aws_iam_role.main.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForRestores"
}

resource "aws_iam_role_policy_attachment" "backup_service_role_policy_for_s3_backup" {
  role       = aws_iam_role.main.name
  policy_arn = "arn:aws:iam::aws:policy/AWSBackupServiceRolePolicyForS3Backup"
}

resource "aws_iam_role_policy_attachment" "backup_service_role_policy_for_s3_restore" {
  role       = aws_iam_role.main.name
  policy_arn = "arn:aws:iam::aws:policy/AWSBackupServiceRolePolicyForS3Restore"
}

# -----------------------------------------------------------------------------------------------------------
#  IAM Data Sources
# -----------------------------------------------------------------------------------------------------------

# Trusted policy for the Backup service
data "aws_iam_policy_document" "backup" {
  statement {
    sid     = "BackupsIAMTrustedPolicy"
    actions = ["sts:AssumeRole"]
    effect  = "Allow"
    principals {
      type        = "Service"
      identifiers = ["backup.amazonaws.com"]
    }
  }
}

# Backup Vault policy for both Shared-Services and source backup accounts
data "aws_iam_policy_document" "copy" {

  # Statement for source accounts (such as M2 workloads)
  dynamic "statement" {
    for_each = var.target_vault.arn == null ? [] : [1]

    content {
      effect    = "Allow"
      actions   = ["backup:CopyIntoBackupVault"]
      resources = ["*"]

      principals {
        type        = "AWS"
        identifiers = [var.target_vault.id]
      }

    }
  }

  # Statement for Shared Services account
  dynamic "statement" {
    for_each = var.target_vault.arn == null ? [1] : []

    content {
      effect    = "Allow"
      actions   = ["backup:CopyIntoBackupVault"]
      resources = ["*"]

      principals {
        type        = "*"
        identifiers = ["*"]
      }

      condition {
        test     = "StringEquals"
        variable = "aws:PrincipalOrgID"
        values   = [var.target_vault.id]
      }
    }
  }
}
