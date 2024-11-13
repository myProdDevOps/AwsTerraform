variable "enable_nat_gateway" {
  description = "Turn on/off NAT Gateway"
  type        = bool
  default     = true
}

variable "public_subnet_id" {
    description = "ID of the public subnet where the NAT Gateway will be placed"
    type        = string
}
