output "eventbridge_rule_arn" {
  description = "The ARN of the EventBridge rule."
  value       = aws_cloudwatch_event_rule.eventbridge_rule.arn
}

output "eventbridge_target_id" {
  description = "The ID of the target for the EventBridge rule."
  value       = aws_cloudwatch_event_target.eventbridge_target.target_id
}

output "eventbridge_target_arn" {
  description = "The ARN of the target for the EventBridge rule."
  value       = aws_cloudwatch_event_target.eventbridge_target.arn
}
