# ☁️ AWS Infrastructure-as-Code (IaC) Portfolio

## Overview
This repository showcases AWS infrastructure built with Terraform, progressing from basic resources to scalable, production-ready architecture. It emphasizes modular design, state management, and high availability.

---

## 🏗️ Architecture

- **Remote State** → S3 + DynamoDB  
- **Networking** → Custom VPC (public/private subnets)  
- **Compute** → EC2 → Auto Scaling Groups (ASG)  
- **Load Balancing** → Application Load Balancer (ALB)  
- **Storage** → Versioned S3 buckets  

---

## 📂 Structure
terraform/
├── bootstrap/aws-setup/ # Remote backend (S3 + DynamoDB)
├── networking/vpc-basic/ # VPC setup
├── compute/
│ ├── ec2-single-instance/ # Basic EC2
│ └── ec2-auto-scaling/ # ASG + ALB
├── storage/s3-bucket/ # S3 configuration
└── modules/ # Reusable components


---

## 🧠 Key Concepts
- **Modularity** → Reusable Terraform modules  
- **DRY Principle** → No repeated configurations  
- **State Safety** → Remote backend with locking  
- **Security** → No secrets in code, controlled access  
- **High Availability** → Multi-AZ + auto scaling  

---


## 🚀 Usage

### 1. Setup Backend
```bash
cd terraform/bootstrap/aws-setup
terraform init
terraform apply

2. Deploy Resources
cd terraform/compute/ec2-server
terraform init
terraform apply

👨‍💻 Author

Edwin Kimutai
Cloud Engineer | DevOps
