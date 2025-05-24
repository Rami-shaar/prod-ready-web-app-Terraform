terraform {
  backend "s3" {
    key = "prod/web-app/terraform.tfstate"
    bucket = "terraform-state-rami1"
    region = "eu-west-2"
    dynamodb_table = "terraform-locks"
    encrypt = true
  }
}


provider "aws" {
  region = "eu-west-2"
}

module "vpc" {
  source = "./modules/VPC"
  vpc_cidr = "10.0.0.0/16"
  public_subnet_1_cidr  = "10.0.1.0/24"
  public_subnet_2_cidr  = "10.0.2.0/24"
  private_subnet_1_cidr = "10.0.11.0/24"
  private_subnet_2_cidr = "10.0.12.0/24"
  region = "eu-west-2"
  project = "webapp"
}

module "ec2" {
  source          = "./modules/EC2"
  vpc_id          = module.vpc.vpc_id
  public_subnets  = [module.vpc.public_subnet_1_id, module.vpc.public_subnet_2_id]
  private_subnets = [module.vpc.private_subnet_1_id, module.vpc.private_subnet_2_id]
  project         = "webapp"
  ami_id          = "ami-0fc32db49bc3bfbb1" 
  instance_type   = "t2.micro"             
}

module "s3" {
  source       = "./modules/S3"
  bucket_name  = "webapp-prod-assets-abkat"
  project      = "webapp"
  environment  = var.environment
}

module "rds" {
  source            = "./modules/RDS"
  project           = "webapp"
  db_name           = "webappdb"
  db_username       = "admin"
  db_password       = var.db_password
  db_instance_class = "db.t3.micro"
    ec2_sg_id       = module.ec2.ec2_sg_id
  subnet_ids        = [module.vpc.private_subnet_1_id, module.vpc.private_subnet_2_id]
  vpc_id            = module.vpc.vpc_id
}