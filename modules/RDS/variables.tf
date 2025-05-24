variable "project" {
  description = "Project name prefix"
  type        = string
}

variable "db_name" {
  description = "Name of the database"
  type        = string
}

variable "db_username" {
  description = "Database master username"
  type        = string
}

variable "db_password" {
  description = "Database master password"
  type        = string
  sensitive   = true
}

variable "db_instance_class" {
  description = "Instance type for RDS"
  type        = string
}

variable "subnet_ids" {
  description = "Private subnets for RDS"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "ec2_sg_id" {
  description = "ID of the EC2 security group allowed to access RDS"
  type        = string
}