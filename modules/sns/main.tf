# --------------------------------------------------------------------
# Amazon SNS topic
# --------------------------------------------------------------------

resource "aws_sns_topic" "main" {
  name            = var.name
  display_name    = var.display_name
  delivery_policy = var.delivery_policy
}

resource "aws_sns_topic_policy" "main" {
  count  = var.policy == null ? 0 : 1
  arn    = aws_sns_topic.main.arn
  policy = var.policy
}

resource "aws_sns_topic_subscription" "main" {
  topic_arn              = aws_sns_topic.main.arn
  protocol               = var.subscription.protocol
  endpoint               = var.subscription.endpoint
  endpoint_auto_confirms = var.subscription.auto_confirms
}
