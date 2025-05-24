variable "project" {
  description = "Project prefix"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "ami_id" {
  description = "AMI to launch"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}