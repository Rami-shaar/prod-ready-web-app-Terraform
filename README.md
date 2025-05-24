# Production-Ready Web App Infrastructure (Terraform)

This project builds a complete **production-ready 3-tier architecture** on AWS using Terraform. It includes:

### 🔧 Modules
- **VPC**: Custom VPC with public and private subnets across AZs, Internet Gateway, NAT Gateway, and route tables.
- **EC2**: Auto Scaling Group and Launch Template behind an Application Load Balancer (ALB).
- **RDS**: MySQL RDS instance deployed in private subnets with secure security group rules.
- **S3**: Versioned S3 bucket with public access blocked.

### ✅ Features
- Modular Terraform code
- Remote state-ready
- Production-level networking setup
- Automatically deploys and bootstraps a web server
- Secure RDS access (MySQL from EC2 only)
- S3 bucket with versioning and security

### 📁 Directory Structure
```
├── main.tf
├── outputs.tf
├── variables.tf
├── terraform.tfvars       # Not included in repo (for secrets)
├── .gitignore              # Ignores .tfstate, .tfvars, IDE configs
├── modules/
│   ├── VPC/
│   ├── EC2/
│   ├── RDS/
│   └── S3/
```

### 🔒 Security Notes
- Secrets like database passwords are stored in `terraform.tfvars`, which is excluded from version control.
- Never hardcode sensitive values in your `.tf` files.

---

### 🚀 Usage
1. Clone this repo
2. Create a `terraform.tfvars` file:
```hcl
project     = "webapp"
region      = "eu-west-2"
environment = "prod"
db_password = "YourStrongPasswordHere"
```

3. Run:
```bash
terraform init
terraform apply
```

---

**Author:** Rami Alshaar
