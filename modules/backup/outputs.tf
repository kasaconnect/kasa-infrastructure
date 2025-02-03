# ---------------------------------------------------------------------------------------------
# AWS Backup outputs
# ---------------------------------------------------------------------------------------------

output "vault_arn" {
  description = "The ARN of the vault"
  value       = aws_backup_vault.main.arn
}

output "vault_name" {
  description = "The name of the vault"
  value       = aws_backup_vault.main.name
}

output "vault_recovery_points" {
  description = "The number of recovery points that are stored in a backup vault"
  value       = aws_backup_vault.main.recovery_points
}

output "plan_id" {
  description = "The id of the backup plan"
  value       = aws_backup_plan.main.id
}

output "selection_id" {
  description = "Backup Selection identifier"
  value       = aws_backup_selection.main.id
}
