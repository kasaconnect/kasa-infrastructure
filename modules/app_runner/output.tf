# ---------------------------------------------------------------------------------------------
# AWS App Runner Outputs
# ---------------------------------------------------------------------------------------------

output "arn" {
  description = "ARN of the App Runner service"
  value       = aws_apprunner_service.main.arn
}

output "service_id" {
  description = "An alphanumeric ID that App Runner generated for this service. Unique within the AWS Region"
  value       = aws_apprunner_service.main.service_id
}

output "service_name" {
  description = "Name of the service"
  value       = aws_apprunner_service.main.service_name
}

output "service_url" {
  description = "Url of the services"
  value       = aws_apprunner_service.main.service_url
}

output "default_domain" {
  value = aws_apprunner_service.main.service_url
}