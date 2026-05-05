# ☁️ AWS Infrastructure-as-Code (IaC) Portfolio

## Overview
This repository showcases AWS infrastructure built with Terraform, progressing from basic resources to scalable, production-ready architecture. It emphasizes modular design, state management, and high availability.

### The Module Structure
Inside your modules/ folder, create a specific directory for this compute pattern:
```bash
terraform-aws-architecture/
│
├── bootstrap/               # The "Chicken & Egg" folder
│   └── remote-state/        # S3 + DynamoDB to host the backend for everything else
│
├── modules/                 # The "Library" (Logic-only, no hardcoded values)
│   ├── networking/          # VPC, Subnets, NAT Gateways
│   ├── compute/             # EC2, Auto Scaling, Load Balancers
│   ├── security/            # IAM Roles, Security Groups, KMS
│   └── storage/             # S3, RDS, EBS
│
├── live/                    # The "Deployments" (Calls the modules)
│   ├── production/
│   │   ├── networking/
│   │   └── web-app/
│   └── staging/
│       ├── networking/
│       └── web-app/
│
├── policies/                # Service Control Policies or Sentinel/Opa
├── scripts/                 # Bash/Python helper scripts (e.g., cleanup, health checks)
├── .gitignore               # Standard Terraform ignores
└── README.md                # The "Master Documentation"
```

## 🧠 Key Concepts

- **Modularity** → Reusable Terraform modules  
- **DRY Principle** → No repeated configurations  
- **State Safety** → Remote backend with locking  
- **Security** → No secrets in code, controlled access  
- **High Availability** → Multi-AZ + auto scaling  


### 1. Setup Backend
```bash
cd terraform/bootstrap/aws-setup
terraform init
terraform apply
```
### 2. Deploy Resources
```bash
cd terraform/Compute/EC2-Server
terraform init
terraform apply
```

### 👨‍💻 Author
Edwin Kimutai |
Certified Solution Architect | Cloud Engineer | DevOps | 
