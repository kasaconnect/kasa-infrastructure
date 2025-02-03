# ---------------------------------------------------------------------------------------------
# Amazon Key Management Service (KMS) Variables
# ---------------------------------------------------------------------------------------------

variable "alias" {
  description = "The display name of the alias. The name must start with alias followed by a forward slash, such as alias/. The alias name can only contain alphanumeric characters, forward slashes, colons, dashes, and underscores."
  type        = string
  nullable    = false
}

variable "description" {
  description = "The description of the key as viewed in AWS console."
  type        = string
  default     = null
}

variable "deletion_window_in_days" {
  description = "Duration in days after which the key is deleted after destruction of the resource, must be between 7 and 30 days. Defaults to 30 days."
  type        = number
  default     = 30
}

variable "enable_key_rotation" {
  description = "Specifies whether key rotation is enabled. Defaults to false."
  type        = bool
  default     = true
}

variable "policy" {
  description = "A valid policy JSON document. For more information about building AWS IAM policy documents with Terraform"
  type        = string
  default     = null
}
