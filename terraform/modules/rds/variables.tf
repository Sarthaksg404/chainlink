variable "environment" {}
variable "application" {}
variable "region" {}
variable "vpc-id" {}
variable "private-subnet-1-id" {}
variable "private-subnet-2-id" {}
variable "port" {}
variable "db_instance_class" {}
variable "db_name" {}
variable "db_identifier" {}

variable "db_username" {
  type      = string
  sensitive = true
}
variable "db_password" {
  type      = string
  sensitive = true
}
