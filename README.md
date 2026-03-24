AWS Infrastructure-as-Code (IaC) Portfolio

Building Scalable, Secure, and Modular Cloud Architecture

This repository serves as a professional showcase of production-grade AWS infrastructure managed via Terraform. It moves beyond basic scripting into high-level architectural patterns, focusing on modularity, high availability, and the DRY (Don't Repeat Yourself) principle.

🏗️ Architecture Overview
This project follows a multi-tier, modular approach. It is designed to be environment-agnostic, allowing for seamless deployments across Development, Staging, and Production using the same underlying code logic.

Core Components
Remote State Management: Secure state storage with S3 and DynamoDB locking.

Compute: Auto Scaling Groups (ASG) using modern Launch Templates.

Networking: Multi-AZ VPC architecture with public and private subnets.

Load Balancing: Application Load Balancers (ALB) for high-availability traffic distribution.

📁 Repository Structure
The repository is organized to separate infrastructure "blueprints" from specific environment "deployments."

bootstrap/: The foundation. Contains the code to create the S3 bucket and DynamoDB table used for Terraform’s remote backend.

modules/: Reusable, logic-only components. These are the "building blocks" (VPC, EC2, ALB) that contain no hardcoded environment values.

live/ (In Progress): Environment-specific configurations that call the modules with specific parameters (e.g., prod vs dev).

policies/: Security and compliance guardrails (IAM policies, SCPs).

🚀 Getting Started
1. Bootstrap the Backend
Before deploying any infrastructure, you must initialize the remote state storage to ensure state safety and team collaboration.

Bash
cd bootstrap/remote-state
terraform init
terraform apply
2. Deploying a Module
To deploy a specific component (e.g., the Web Cluster), navigate to the corresponding environment folder and run:

Bash
terraform init
terraform plan
terraform apply
🛡️ Best Practices Applied
State Locking: Prevented race conditions and state corruption via DynamoDB.

Modularization: Standardized resource creation to ensure consistency and reduce manual errors.

Security First: No secrets are committed to version control; all sensitive variables are handled via .tfvars (ignored) or AWS Secret Manager.

Zero-Downtime Updates: Utilized create_before_destroy lifecycles in Launch Templates for seamless scaling.

👨‍💻 Author
Edwin Kimutai AWS Certified Solutions Architect | DevOps | Cloud Engineer [] | []
