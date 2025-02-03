
variable "name" {
  description = "The name of the SQS queue"
  type        = string
}

variable "policy" {
  description = "The policy for the SQS queue"
  type        = string
}

variable "fifo_queue" {
  description = "Boolean whether the queue is FIFO"
  type        = bool
}

variable "content_based_deduplication" {
  description = "Boolean whether to enable content-based deduplication"
  type        = bool
}

variable "visibility_timeout_seconds" {
  description = "The visibility timeout for the queue"
  type        = number
}

variable "dead_letter_target_arn" {
  description = "The ARN of the dead letter queue to which Amazon SQS moves messages after the value of maxReceiveCount is exceeded."
  type        = string
}

variable "max_receive_count" {
  description = "The number of times a message is delivered to the source queue before being moved to the dead letter queue."
  type        = number
  default     = 5
}