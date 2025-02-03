# ------------------------------------------------------------------------
# Amazon SNS topic variables
# ------------------------------------------------------------------------

variable "name" {
  description = "The name of the topic. Topic names must be made up of only uppercase and lowercase ASCII letters, numbers, underscores, and hyphens, and must be between 1 and 256 characters long. For a FIFO (first-in-first-out) topic, the name must end with the .fifo suffix. If omitted, Terraform will assign a random, unique name. Conflicts with name_prefix"
  type        = string
}

variable "display_name" {
  description = "The display name for the topic"
  type        = string
}

variable "policy" {
  description = "The fully-formed AWS policy as JSON. For more information about building AWS IAM policy documents with Terraform, see the AWS IAM Policy Document Guide: https://learn.hashicorp.com/terraform/aws/iam-policy"
  type        = string
  default     = null
}

variable "delivery_policy" {
  description = "The SNS delivery policy. More on AWS documentation: https://docs.aws.amazon.com/sns/latest/dg/DeliveryPolicies.html"
  type        = string
  default     = null
}

variable "subscription" {
  description = "Provides a resource for subscribing to SNS topics. Requires that an SNS topic exist for the subscription to attach to."
  type = object({
    protocol      = string
    endpoint      = string
    auto_confirms = bool
  })
}
