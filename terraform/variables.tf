variable "aws_region" {
  type        = string
  default     = "ap-south-2"
  description = "AWS region to deploy resources"
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "Environment name (dev, staging, prod)"
}

variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR block for the VPC"
}

variable "db_name" {
  type        = string
  default     = "appdb"
  description = "PostgreSQL Database Name"
}

variable "db_username" {
  type        = string
  default     = "dbadmin"
  description = "PostgreSQL Master Username"
}