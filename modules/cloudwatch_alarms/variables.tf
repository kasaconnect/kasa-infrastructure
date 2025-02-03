# --------------------------------------------------------------------
# Amazon CloudWatch Alarms variables
# --------------------------------------------------------------------

variable "alarm_name" {
  description = "The name of the alarm"
  type        = string
}

variable "comparison_operator" {
  description = "The comparison operator to use"
  type        = string
}

variable "evaluation_periods" {
  description = "The number of periods over which data is compared to the specified threshold"
  type        = number
}

variable "metric_name" {
  description = "The name of the metric to evaluate"
  type        = string
}

variable "namespace" {
  description = "The namespace of the metric to evaluate"
  type        = string
}

variable "period" {
  description = "The period in seconds over which the specified statistic is applied"
  type        = number
}

variable "statistic" {
  description = "The statistic to apply to the alarm's associated metric"
  type        = string
}

variable "threshold" {
  description = "The value against which the specified statistic is compared"
  type        = number

}

variable "alarm_actions" {
  description = "The list of actions to take when the alarm transitions into an ALARM state"
  type        = string
}


variable "alarm_description" {
  description = "The description for the alarm"
  type        = string
}

variable "ok_actions" {
  description = "The list of actions to take when the alarm transitions into an OK state"
  type        = string
}

variable "dimensions" {
  description = "A map of dimension key and value"
  type        = map(string)
}

variable "unit" {
  description = "The unit for the alarm's associated metric"
  type        = string
}
