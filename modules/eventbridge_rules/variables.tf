variable "name" {
  description = "The name of the EventBridge rule."
  type        = string
}

variable "description" {
  description = "The description of the EventBridge rule."
  type        = string
  default     = ""
}

variable "schedule_expression" {
  description = "The schedule expression for the EventBridge rule."
  type        = string
}

variable "target_id" {
  description = "The ID of the target for the EventBridge rule."
  type        = string
}

variable "target_arn" {
  description = "The ARN of the target for the EventBridge rule."
  type        = string
}

variable "lambda_function_name" {
  description = "The name of the Lambda function to be invoked by the EventBridge rule."
  type        = string
}
