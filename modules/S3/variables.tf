variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "project" {
  description = "Project tag"
  type        = string
}

variable "environment" {
  description = "Environment tag (e.g. dev, prod)"
  type        = string
}