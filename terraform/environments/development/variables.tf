variable "environment" {
  description = "Development Environment"
  default     = "development"
}

variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "availability_zone-1" {
  description = "Availability zone"
  default     = "us-east-1a"
}

variable "availability_zone-2" {
  description = "Availability zone"
  default     = "us-east-1b"
}

variable "application" {
  default     = "chainlink"
  description = "Application name"
}

####
# RDS
###

variable "db_username" {
  sensitive = true
}

variable "db_password" {
  sensitive = true
}

variable "db_port" {
  default = 5432
}

variable "db_instance_class" {
  default = "db.t2.small"
}

variable "db_name" {
  default = "accounts_dev"
}

variable "db_identifier" {
  default = "chainlink-dev"
}

####
# Elasticcache
###

variable "redis_name" {
  default = "redis-chainlink"
}

variable "redis_port" {
  default = 6379
}

variable "redis_password" {
  sensitive = "true"
}