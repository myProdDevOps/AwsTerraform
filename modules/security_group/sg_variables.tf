variable description {
  description = "Security group description"
  type        = string
  default     = "Security group for VPC"
}

// Ingress
variable ingress_rules_with_cidr {
  description = "List of ingress rules"
  type = list(object({
    description = optional(string)
    from_port = number
    to_port   = number
    protocol = optional(string, "tcp")
    ip = optional(string)
  }))
  default = []
}

variable "ingress_rules_with_security_group" {
  description = "List of ingress rules"
  type = list(object({
    description       = optional(string)
    from_port         = optional(number)
    to_port           = optional(number)
    protocol          = optional(string, "tcp")
    security_group_id = optional(string)
  }))
  default = []
}

// Egress
variable egress_rules_with_cidr {
  description = "List of egress rules"
  type = list(object({
    description = optional(string)
    from_port = number
    to_port   = number
    protocol = optional(string, "-1")
    ip = optional(string)
  }))
  default = []
}

variable egress_rules_with_security_group {
  description = "List of egress rules"
  type = list(object({
    description = optional(string)
    from_port = number
    to_port   = number
    protocol = optional(string, "-1")
    security_group_id = optional(string)
  }))
  default = []
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "name" {
  description = "Name of the security group"
  type        = string
}