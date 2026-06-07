# CloudSec ECS Deployment Platform

Production-ready deployment of the cloudsec application using:

- Docker
- Amazon ECS Fargate
- Amazon ECR
- Application Load Balancer
- Route53
- AWS Certificate Manager (ACM)
- Terraform
- GitHub Actions
- Amazon S3 (Terraform Remote State)
- DynamoDB (Terraform State Locking)
- VPC Endpoints

Live deployment:

https://tm.hudeifadev.com

## Project Overview

This project was delivered for a client requiring a secure, scalable and fully reproducible deployment of the Threat Composer application on AWS.

The objective was to replace manual infrastructure provisioning with Infrastructure as Code while providing:

- HTTPS encryption
- Custom domain routing
- Containerized application deployment
- High availability across multiple Availability Zones
- Automated infrastructure provisioning through Terraform
- Scalable container orchestration using ECS Fargate

## Solution Architecture

![alt text](<images/architecture diagram.png>)

## Architecture Highlights

- Multi-AZ deployment across two Availability Zones
- ECS Fargate serverless container platform
- Private subnet application deployment
- Public Application Load Balancer
- HTTPS enforced through ACM certificates
- Route53 custom domain routing
- Terraform Infrastructure as Code
- GitHub Actions CI/CD
- Remote Terraform state using S3
- Terraform state locking using DynamoDB
- VPC Endpoints replacing NAT Gateway connectivity

## Infrastructure Components

### Networking
- Custom VPC
- 2 Public Subnets
- 2 Private Subnets
- Internet Gateway
- Route Tables

### Compute
- ECS Cluster
- ECS Service
- Fargate Tasks

### Private Connectivity

- S3 Gateway Endpoint
- ECR API Endpoint
- ECR DKR Endpoint
- CloudWatch Logs Endpoint

These endpoints allow ECS tasks running in private subnets to communicate with AWS services without requiring a NAT Gateway.

### Load Balancing
- Application Load Balancer
- HTTP → HTTPS Redirect
- Target Group Health Checks

### Container Registry
- Amazon ECR

### DNS & TLS
- Route53 Hosted Zone
- ACM Certificate


## Repository Structure

```text
infra/
├── backend.tf
├── provider.tf
├── main.tf
├── variables.tf
├── outputs.tf
├── bootstrap/
└── modules/
    ├── vpc/
    ├── ecr/
    ├── alb/
    ├── ecs/
    └── acm_route53/

src/
public/

dockerfile
nginx.conf
README.md
```
## CI/CD Pipelines

### Terraform Plan

- Runs terraform fmt
- Runs terraform validate
- Generates terraform plan
- Uses GitHub OIDC authentication
- Uses read-only infrastructure permissions

### Terraform Deploy

- Executes terraform apply
- Uses remote Terraform state
- Uses DynamoDB state locking

### Application Deploy

- Builds Docker image
- Pushes image to Amazon ECR
- Updates ECS task definition
- Deploys new task revision to ECS Fargate

### Terraform Plan Workflow

![alt text](<images/Screenshot 2026-06-07 at 22.12.46.png>)

### Terraform Deploy Workflow

![alt text](<images/Screenshot 2026-06-07 at 22.15.49.png>)

### Terraform AppDeploy Workflow

![alt text](<images/Screenshot 2026-06-07 at 22.21.38.png>)

## Deployment Workflow

```text
Developer
    │
    ▼
Docker Build
    │
    ▼
Amazon ECR
    │
    ▼
Terraform Apply
    │
    ▼
Amazon ECS Fargate
    │
    ▼
Application Load Balancer
    │
    ▼
Route53
    │
    ▼
HTTPS Endpoint
```

## Live Application

![alt text](<images/Screenshot 2026-06-02 at 16.15.53.png>)

## Terraform Modules

### VPC Module

Creates:

- VPC
- Public Subnets
- Private Subnets
- Route Tables
- Internet Gateway

### ECR Module

Creates:

- Container Repository

### ALB Module

Creates:

- Application Load Balancer
- Target Group
- Listener Rules

### ECS Module

Creates:

- ECS Cluster
- Task Definition
- ECS Service

### ACM Route53 Module

Creates:

- DNS Records
- SSL Certificate
- Validation Records

## Security

The platform implements multiple security controls:

- HTTPS enforced using ACM certificates
- HTTP automatically redirected to HTTPS
- ECS tasks deployed in private subnets
- Application Load Balancer is the only public entry point
- Security Groups restrict inbound traffic
- Private Amazon ECR repository
- GitHub OIDC authentication (no long-lived AWS credentials)
- Terraform remote state stored in Amazon S3
- Terraform state locking via DynamoDB
- VPC Endpoints used for private AWS service communication

## Engineering Challenges Solved


Key challenges solved during delivery:

- ECS task health check troubleshooting
- ALB target registration debugging
- ACM certificate validation workflow
- Route53 DNS delegation and propagation
- GitHub OIDC role assumption configuration
- Terraform remote state implementation
- Terraform state locking and stale lock resolution
- Terraform module refactoring
- ECS image versioning strategy
- VPC Endpoint implementation for private AWS connectivity