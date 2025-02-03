# -------------------------------------------------------------
# AWS SQS outputs
# -------------------------------------------------------------

output "arn" {
  value = aws_sqs_queue.main.arn
}

output "id" {
  value = aws_sqs_queue.main.id
}

output "url" {
  value = aws_sqs_queue.main.url
}
