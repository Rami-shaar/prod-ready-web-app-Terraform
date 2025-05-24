variable "vpc_cidr" {
  description = "CIDR block for the vpc"
  type = string
}

variable "project" {
  description = "Project name prefix"
  type = string 
}

variable "region" {
  type = string
  description = "AWS region"  
}

variable "public_subnet_1_cidr" {
  type = string
  description = "CIDR block for public subnet 1"
}

variable "public_subnet_2_cidr" {
  type = string
  description = "CIDR block for public subnet 2"
}

variable "private_subnet_1_cidr" {
  type        = string
  description = "CIDR block for private subnet 1"
}

variable "private_subnet_2_cidr" {
  type        = string
  description = "CIDR block for private subnet 2"
}