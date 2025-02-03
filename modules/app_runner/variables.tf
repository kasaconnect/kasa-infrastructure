# ---------------------------------------------------------------------------------------------
# App Runner variables
# ---------------------------------------------------------------------------------------------

variable "name" {
  description = "Name of the service."
  type        = string
}

variable "min_size" {
  description = " Minimal number of instances that App Runner provisions for your service"
  type        = string
}

variable "max_size" {
  description = " Maximal number of instances that App Runner provisions for your service"
  type        = string
}

variable "vpc_connector_subnets" {
  description = "List of IDs of subnets that App Runner should use when it associates your service with a custom Amazon VPC. Specify IDs of subnets of a single Amazon VPC. App Runner determines the Amazon VPC from the subnets you specify."
  type        = list(string)
}

variable "vpc_connector_sgs" {
  description = "List of IDs of security groups that App Runner should use for access to AWS resources under the specified subnets. If not specified, App Runner uses the default security group of the Amazon VPC. The default security group allows all outbound traffic."
  type        = list(string)
}

variable "auto_deployments_enabled" {
  description = "Whether continuous integration from the source repository is enabled for the App Runner service. If set to true, each repository change (source code commit or new image version) starts a deployment. Defaults to true."
  type        = bool
}

variable "configuration_source" {
  description = "Source of the App Runner configuration. Valid values: REPOSITORY, API."
  type        = string
}

variable "repository_url" {
  description = "Location of the repository that contains the source code."
  type        = string
}

variable "type" {
  description = "Type of version identifier. For a git-based repository, branches represent versions"
  type        = string
}

variable "value" {
  description = "Source code version. For a git-based repository, a branch name maps to a specific version. App Runner uses the most recent commit to the branch."
  type        = string
}

variable "cpu" {
  description = "Number of CPU units reserved for each instance of your App Runner service represented as a String. Defaults to 1024"
  type        = number
}

variable "memory" {
  description = "Amount of memory, in MB or GB, reserved for each instance of your App Runner service. Defaults to 2048"
  type        = number
}

variable "is_publicly_accessible" {
  description = "Specifies whether your App Runner service is publicly accessible. To make the service publicly accessible set it to True. To make the service privately accessible, from only within an Amazon VPC set it to False."
  type        = bool
}

variable "observability_enabled" {
  type        = bool
  description = "When true, an observability configuration resource is associated with the service"
}

variable "code_configuration" {
  type = object({
    build_command = string
    port          = number
    runtime       = string
    start_command = string
  })
  description = "Configuration for building and running the service from a source code repository."

}

variable "connection_arn" {
  description = "ARN of the App Runner connection that enables the App Runner service to connect to a source repository. Required for GitHub code repositories."
  type        = string
}

variable "environment_variables" {
  description = "Environment variables available to your running App Runner service. A map of key/value pairs. Keys with a prefix of AWSAPPRUNNER are reserved for system use and aren't valid."
  type        = map(string)
}

variable "environment_secrets" {
  description = "Secrets and parameters available to your service as environment variables. A map of key/value pairs, where the key is the desired name of the Secret in the environment (i.e. it does not have to match the name of the secret in Secrets Manager or SSM Parameter Store), and the value is the ARN of the secret from AWS Secrets Manager or the ARN of the parameter in AWS SSM Parameter Store."
  type        = any
}

variable "instance_role_arn" {
  description = "The ARN of the IAM role to associate with the App Runner instance"
  type        = string
  default = ""
}

variable "auto_scaling_configuration_name" {
  description = "The name of autoscaling configuration"
  type        = string
}