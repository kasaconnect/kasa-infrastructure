variable "name" {
  description = "Name of the parameter. If the name contains a path (e.g., any forward slashes (/)), it must be fully qualified with a leading forward slash (/). For additional requirements and constraints, see the AWS SSM User Guide."
  type        = string
}

variable "description" {
  description = "Description of the parameter."
  type        = string
}

variable "value" {
  description = "Value of the parameter. This value is always marked as sensitive in the Terraform plan output, regardless of type."
  type        = string
}

variable "type" {
  description = "Type of the parameter. Valid types are String, StringList and SecureString."
  type        = string
}
