output "arn" {
  description = "The SSM parameter ARN"
  value       = aws_ssm_parameter.main.arn
}

output "name" {
  description = "The SSM parameter name"
  value       = aws_ssm_parameter.main.name
}

output "value" {
  description = "The SSM parameter value"
  value       = aws_ssm_parameter.main.value
}
