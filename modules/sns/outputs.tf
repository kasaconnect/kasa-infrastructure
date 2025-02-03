# ------------------------------------------------------------------------
# Amazon SNS topic outputs
# ------------------------------------------------------------------------

output "arn" {
  value       = aws_sns_topic.main.arn
  description = "The ARN of the SNS topic, as a more obvious property (clone of id)"
}

output "id" {
  value       = aws_sns_topic.main.id
  description = "The ARN of the SNS topic"
}

output "name" {
  value       = aws_sns_topic.main.name
  description = "The name of the SNS topic"
}

output "owner" {
  value       = aws_sns_topic.main.owner
  description = "The AWS Account ID of the SNS topic owner"
}
