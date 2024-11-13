// Variables relating to the VPC CIDR
variable vpc_cidr {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_subnets_cidr" {
  description = "CIDR blocks for public subnets"
  type = list(string)
}

variable "private_subnets_cidr" {
  description = "CIDR blocks for private subnets"
  type = list(string)
}

// ====END VPC CIDR VARIABLES====

variable vpc_name {
  description = "Name of the VPC"
  default     = "mrtux"
  type        = string
}

variable "enable_dns_hostnames" {
  description = "A boolean flag to enable/disable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "A boolean flag to enable/disable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "availability_zones" {
  description = "Availability zones"
  type = list(string)
}