output "alb_dns_name" {
  description = "The DNS name of the Application Load Balancer"
  value       = module.ec2.alb_dns_name
}

output "s3_bucket_name" {
  description = "S3 bucket name"
  value       = module.s3.bucket_name
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}