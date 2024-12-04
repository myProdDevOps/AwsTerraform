// Default VPC id
variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

// Default Ids for subnets
variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type = list(string)
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type = list(string)
}

variable "enable_nat_gateway" {
  description = "Whether to create a private route table with NAT Gateway"
  type        = bool
}

// Default gateway ids
variable "internet_gateway_id" {
  description = "ID of the Internet Gateway"
  type        = string
}

variable "nat_gateway_id" {
  description = "ID of the NAT Gateway"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}
