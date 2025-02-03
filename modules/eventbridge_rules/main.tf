resource "aws_cloudwatch_event_rule" "eventbridge_rule" {
  name                = var.name
  description         = var.description
  schedule_expression = var.schedule_expression
}

resource "aws_cloudwatch_event_target" "eventbridge_target" {
  rule      = aws_cloudwatch_event_rule.eventbridge_rule.name
  target_id = var.target_id
  arn       = var.target_arn
}

resource "aws_lambda_permission" "allow_eventbridge" {
  statement_id  = "AllowExecutionFromEventBridge"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.eventbridge_rule.arn
}
