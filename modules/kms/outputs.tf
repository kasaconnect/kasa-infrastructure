# ---------------------------------------------------------------------------------------------
# Amazon Key Management Service (KMS) Outputs
# ---------------------------------------------------------------------------------------------

output "alias" {
  description = "The display name of the alias"
  value       = aws_kms_alias.main.name
}

output "arn" {
  description = "The Amazon Resource Name (ARN) of the key"
  value       = aws_kms_key.main.arn
}

output "key_id" {
  description = "The ID of the key"
  value       = aws_kms_key.main.key_id
}
