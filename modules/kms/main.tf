# ---------------------------------------------------------------------------------------------
# Amazon Key Management Service (KMS)
# ---------------------------------------------------------------------------------------------

resource "aws_kms_alias" "main" {
  name          = "alias/${var.alias}"
  target_key_id = aws_kms_key.main.key_id
}

resource "aws_kms_key" "main" {
  deletion_window_in_days = var.deletion_window_in_days
  description             = var.description
  enable_key_rotation     = var.enable_key_rotation
}

resource "aws_kms_key_policy" "main" {
  key_id = aws_kms_key.main.key_id
  policy = data.aws_iam_policy_document.main.json
}
