variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS profile"
  type        = string
  default     = "default"
}

variable "aws_environment" {
  description = "Environment"
  type        = string
  default     = "Testing"
}

variable "aws_project" {
  description = "Project"
  type        = string
  default     = "AWS Terraform"
}

variable "aws_owner" {
  description = "Owner"
  type        = string
  default     = "MrTux"
}
