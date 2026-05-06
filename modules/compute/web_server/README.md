# Dockerized Web Host: Registry-Driven Deployment

This project demonstrates the evolution of a professional web deployment workflow. It transitions from a basic "Git-pull" method (building on the server) to a modern **CI/CD-ready pattern** using Docker Hub for image management and Terraform for infrastructure automation.

---

## 🔄 The Evolution: Git vs. Registry
By moving to a Registry-based workflow, I’ve optimized the pipeline for speed, consistency, and portability.

| Feature | Phase 1: Git-Based | Phase 2: Registry-Based (Current) |
| :--- | :--- | :--- |
| **Workflow** | Clone source code on EC2 → Build image on EC2. | Build image locally → Push to Registry → Pull on EC2. |
| **Speed** | Slower (requires build time on every launch). | Faster (instantly pulls pre-compiled layers). |
| **Consistency** | Risk of "it worked on my machine but not the server." | Immutable artifacts; the exact same image is used everywhere. |
| **Scalability** | Hard to manage across multiple instances. | **K8s Ready:** Essential for scaling in clusters. |

---

## 🏗️ Architecture
1.  **Local Development:** Application code is containerized using a `Dockerfile`.
2.  **Image Registry:** The image is built, tagged, and pushed to **Docker Hub**.
3.  **Infrastructure as Code:** **Terraform** provisions the AWS EC2 instance and required Security Groups.
4.  **Automated Bootstrapping:** 
    *   The EC2 instance uses `user_data` to install the Docker Engine.
    *   It automatically pulls the specific image from the registry.
    *   The container is deployed and mapped to port 80.

---

## 🚀 Deployment Workflow

### 1. Image Preparation
```bash
# Build the image locally
docker buildx build --platform linux/amd64 -t kimruto/portfolio_website:latest

# Push to Docker Hub
docker push kimruto/portfolio_website:latest
```

### 2. Infrastructure Launch
Ensure your AWS credentials are configured, then execute:


```Bash
terraform init
terraform plan
terraform apply -auto-approve
```

### 🛠️ Tech Stack
- Terraform: Infrastructure Provisioning.
- Docker: Containerization and Runtime.
- Docker Hub: Artifact Storage and Versioning.
- AWS (EC2/VPC): Cloud Hosting.
- Bash: Automated Bootstrap Scripting.

### ⏩ Next Steps: The Road to Kubernetes (K8s)
The current Registry-based model is the final prerequisite for orchestrating workloads with Kubernetes. My next phase involves:
- Migrating this deployment to a Kubernetes cluster (Minikube/EKS).
- Implementing Self-healing and Auto-scaling.
- Managing configurations using K8s Manifests (Deployments and Services).

#### Note: This project is part of a continuous DevOps learning path, moving from manual setups to fully automated cloud-native architectures.
