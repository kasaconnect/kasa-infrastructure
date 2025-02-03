# --------------------------------------------------------------------
# Amazon CloudWatch Alarms
# --------------------------------------------------------------------

resource "aws_cloudwatch_metric_alarm" "main" {
  alarm_name          = var.alarm_name
  comparison_operator = var.comparison_operator
  evaluation_periods  = var.evaluation_periods
  metric_name         = var.metric_name
  namespace           = var.namespace
  period              = var.period
  statistic           = var.statistic
  threshold           = var.threshold
  unit                = var.unit

  # Alarms actions and dimensions
  alarm_description = var.alarm_description
  alarm_actions     = [var.alarm_actions]
  ok_actions        = [var.ok_actions]
  dimensions        = var.dimensions
}
