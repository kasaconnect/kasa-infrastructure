# ---------------------------------------------------------------------------------------------
# AWS Backup variables
# ---------------------------------------------------------------------------------------------

variable "name" {
  description = "The name of the resources"
  type        = string
}

variable "role_name" {
  description = "The name of the IAM role to assign to the backup plan"
  type        = string
}

variable "kms_key_arn" {
  description = "The ARN of the KMS key used to encrypt the backups"
  type        = string
  default     = null
}

variable "not_resources" {
  description = "An array of strings that either contain Amazon Resource Names (ARNs) or match patterns of resources to exclude from a backup plan."
  type        = list(string)
  default     = null
}

variable "resources" {
  description = "An array of strings that either contain Amazon Resource Names (ARNs) or match patterns of resources to assign to a backup plan."
  type        = list(string)
  default     = null
}

variable "rules" {
  description = "A CRON expression specifying when AWS Backup initiates a backup job."
  type        = list(map(string))
}

variable "target_vault" {
  description = "The ARN of the backup vault to copy the backup plan."
  type        = map(string)
  default     = null
}

variable "tags_condition" {
  description = "Tag-based conditions used to specify a set of resources to assign to a backup plan."
  type        = map(any)
  default     = {}
}
