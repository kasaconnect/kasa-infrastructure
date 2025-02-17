resource "aws_ssm_parameter" "main" {
  name        = var.name
  description = var.description
  type        = var.type
  value       = var.value

  lifecycle {
    ignore_changes = [
      value
    ]
  }
}
