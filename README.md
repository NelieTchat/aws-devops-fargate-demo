# 🚀 AWS DevOps Fargate Demo (Dev-first)

Portfolio-ready project: a containerized **Node.js app** deployed on **AWS ECS Fargate**, provisioned with **Terraform**, and automated with **GitHub Actions**.

---

## 📌 Phases

1. **Scaffold repo** ✅  
   Initialize project structure, GitHub repo, and `.gitignore`.

2. **Local app (Node.js)**  
   Simple Express server with `/` and `/health` endpoints.

3. **Dockerize app**  
   Containerize using `Dockerfile` and run locally with `docker run`.

4. **Dev infra on AWS (Terraform)**  
   Deploy ALB + ECS Fargate service in default VPC for first working demo.

5. **CI/CD with GitHub Actions**  
   Automate build → push (ECR) → deploy (Terraform).

6. **Hardening & extensions**  
   - Private subnets + VPC endpoints (no NAT).  
   - Secrets in **SSM Parameter Store**.  
   - Autoscaling with CloudWatch alarms.  
   - (Optional) HTTPS with ACM + Route 53.

> ✅ Built step-by-step for clarity and learning.

---

## 🏗️ Architecture Overview

```text
                   ┌──────────────────────────┐
                   │      Route 53 (DNS)      │
                   └─────────────┬────────────┘
                                 │
                         ┌───────▼────────┐
                         │   ALB (80/443) │
                         └───────┬────────┘
                                 │
                  ┌──────────────┴───────────────┐
                  │                              │
         ┌────────▼─────────┐           ┌────────▼─────────┐
         │   ECS Fargate    │           │   ECS Fargate    │
         │ (private subnet) │  ...      │ (private subnet) │
         └────────┬─────────┘           └────────┬─────────┘
                  │                              │
         ┌────────▼─────────┐            ┌───────▼──────────┐
         │ CloudWatch Logs  │            │ SSM Parameter    │
         │ & Metrics        │            │ Store (secrets)  │
         └──────────────────┘            └──────────────────┘

     [Private Subnets + VPC Endpoints: ECR, Logs, SSM, S3 → no NAT required]
## 🔧 Tools & Services
- **Terraform** → Infrastructure as Code  
- **Docker** → App containerization  
- **ECR** → Container registry  
- **ECS Fargate** → Serverless container platform  
- **CloudWatch** → Logs & alarms  
- **SSM Parameter Store** → Manage secrets securely  

---

## 🛠️ Runbook

### Deploy
1. Build & push app image:
   ```bash
   docker build -t fargate-demo-app:<tag> app/
   docker tag fargate-demo-app:<tag> <account_id>.dkr.ecr.<region>.amazonaws.com/fargate-demo-app:<tag>
   docker push <account_id>.dkr.ecr.<region>.amazonaws.com/fargate-demo-app:<tag>