# --------------------------------------------------------------------
# Amazon SQS QUEUE
# --------------------------------------------------------------------

resource "aws_sqs_queue" "main" {
  name                        = var.name
  policy                      = var.policy
  fifo_queue                  = var.fifo_queue
  content_based_deduplication = var.content_based_deduplication
  visibility_timeout_seconds  = var.visibility_timeout_seconds

  redrive_policy = var.dead_letter_target_arn != null ? jsonencode({
    deadLetterTargetArn = var.dead_letter_target_arn
    maxReceiveCount     = var.max_receive_count
  }) : null
}