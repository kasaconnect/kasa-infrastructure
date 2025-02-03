# ---------------------------------------------------------------------------------------------
# Datasources
# ---------------------------------------------------------------------------------------------

data "aws_caller_identity" "current" {}

# ---------------------------------------------------------------------------------------------
# KMS Policy Document
# ---------------------------------------------------------------------------------------------

data "aws_iam_policy_document" "root" {

  # Statement 1 - Granting root access to KMS key
  statement {
    sid    = "Enable IAM User Permissions"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
    }

    actions   = ["kms:*"]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "main" {
  source_policy_documents = flatten([
    data.aws_iam_policy_document.root.json,
    var.policy == null ? [] : [var.policy]
  ])
}
