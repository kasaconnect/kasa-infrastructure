# -----------------------------------------------------------------------------------------------------------
# AWS Amplify variables
# -----------------------------------------------------------------------------------------------------------

variable "name" {
  description = "The name of the Amplify app."
  type        = string
}

variable "repository_url" {
  description = "The repository URL for the Amplify app."
  type        = string
}

variable "oauth_token" {
  description = "The OAuth token for the Amplify app."
  type        = string
}

variable "branch" {
  description = "The branch for the Amplify app."
  type        = string
}

variable "framework" {
  description = "The framework for the Amplify app."
  type        = string
}

variable "build_spec" {
  description = "The build spec for the Amplify app."
  type        = string
  default     = null
}

variable "environment_variables" {
  description = "The environment variables for the Amplify app."
  type        = map(any)
  default     = {}
}

variable "branch_environment_variables" {
  description = "The branch environment variables for the Amplify app."
  type        = map(any)
  default     = {}
}

variable "live_updates" {
  description = "The live updates for the Amplify app."
  type        = list(any)
  default     = []
}

variable "custom_image" {
  description = "The custom image for the Amplify app."
  type        = string
}

variable "domain_name" {
  description = "The domain name for the Amplify app."
  type        = string
}

variable "iam_service_role_arn" {
  description = "The role for amplify"
  type = string
}

variable "buildspec_file" {
  description = "The location of buildspec file"
  type = string
}

variable "platform" {
  description = "The value of platform"
  type = string
}

variable "enable_basic_auth" {
  type        = bool
  description = "Enable basic authentication for the Amplify app"
  default     = false
}

variable "basic_auth_username" {
  type        = string
  description = "Username for app access"
  default     = ""
}

variable "basic_auth_password" {
  type        = string
  description = "Password for app access"
  default     = ""
}
