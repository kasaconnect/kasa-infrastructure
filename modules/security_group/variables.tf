# -----------------------------------------------------------------------------------------------------------
# Security groups variables
# -----------------------------------------------------------------------------------------------------------

variable "name" {
  description = "The name of the security group"
  type        = string
}

variable "description" {
  description = "The description of the security group"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID"
  type        = string
}

variable "ingress_rules" {
  description = "The ingress rules for the security group"
  type = list(object({
    cidr_ipv4   = string
    from_port   = number
    ip_protocol = string
    to_port     = number
  }))
}

variable "referenced_sg_ingress" {
  type = list(object({
    referenced_security_group_id = string
    from_port   = number
    ip_protocol = string
    to_port     = number
  }))
  default = []
}

variable "egress_rules" {
  description = "The egress rules for the security group"
  type = list(object({
    cidr_ipv4   = string
    from_port   = optional(number, null)
    ip_protocol = string
    to_port     = optional(number, null)
  }))
}
