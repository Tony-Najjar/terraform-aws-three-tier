# AWS Three-Tier Architecture Using Terraform

## Project Overview

This project demonstrates the design and deployment of a highly available three-tier web application architecture on AWS using **Terraform Infrastructure as Code (IaC)**.

The goal of this project was to automate the provisioning of a production-style AWS environment consisting of a networking layer, web/application layer, and database layer.

The infrastructure was deployed using Terraform to create a scalable and maintainable AWS environment following cloud architecture best practices.

---

# Architecture Overview

The architecture consists of three main layers:

## 1. Web Layer (Presentation Tier)

- Amazon CloudFront provides global content delivery and caching.
- An Application Load Balancer distributes incoming traffic across multiple EC2 instances.
- EC2 instances run NGINX as the web server.

## 2. Application Layer

- EC2 instances are managed through an Auto Scaling Group.
- Launch Templates define the EC2 instance configuration.
- Auto Scaling provides high availability and automatic instance replacement.

## 3. Database Layer

- Amazon RDS MySQL provides the managed relational database service.
- The database is deployed inside private subnets.
- Security groups restrict access between application servers and the database.

---

# Architecture Diagram

_Add your architecture diagram here._

Example:

```
                  Users
                    |
                    v
             CloudFront CDN
                    |
                    v
        Application Load Balancer
                    |
                    v
        EC2 Auto Scaling Group
             (NGINX Servers)
                    |
                    v
             Amazon RDS MySQL
             (Private Subnet)
```

---

# AWS Services Used

| Service                   | Purpose                                           |
| ------------------------- | ------------------------------------------------- |
| Amazon VPC                | Provides isolated cloud networking                |
| Public Subnets            | Hosts internet-facing resources                   |
| Private Subnets           | Hosts protected application/database resources    |
| Internet Gateway          | Provides internet connectivity                    |
| NAT Gateway               | Allows private resources outbound internet access |
| Security Groups           | Controls inbound and outbound traffic             |
| EC2                       | Hosts NGINX web servers                           |
| Launch Template           | Defines EC2 configuration                         |
| Auto Scaling Group        | Maintains application availability                |
| Application Load Balancer | Distributes user traffic                          |
| Amazon RDS MySQL          | Provides managed relational database              |
| CloudFront                | Provides CDN and improves content delivery        |
| Terraform                 | Automates infrastructure deployment               |

---

# Terraform Project Structure

```
terraform-three-tier/
│
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── networking.tf
│   ├── security.tf
│   ├── ec2.tf
│   ├── alb.tf
│   ├── autoscaling.tf
│   ├── rds.tf
│   └── cloudfront.tf
│
├── screenshots/
│
├── README.md
│
└── .gitignore
```

---

# Deployment Process

## 1. Initialize Terraform

```bash
terraform init
```

## 2. Validate Configuration

```bash
terraform validate
```

## 3. Review Infrastructure Changes

```bash
terraform plan
```

## 4. Deploy Infrastructure

```bash
terraform apply
```

## 5. Destroy Infrastructure

```bash
terraform destroy
```

---

# Screenshots

## Terraform Deployment

_Add Terraform apply screenshot_

---

## AWS VPC Architecture

_Add VPC screenshot_

---

## Application Load Balancer

_Add ALB screenshot_

---

## EC2 Instances Running NGINX

_Add EC2 screenshot_

---

## Auto Scaling Group

_Add ASG screenshot_

---

## Amazon RDS MySQL

_Add RDS screenshot_

---

## CloudFront Distribution

_Add CloudFront screenshot_

---

## Application Running

_Add browser screenshot showing deployed application_

---

# Security Design

Security practices implemented:

- Web servers are protected using security groups.
- Database resources are deployed in private subnets.
- Database access is restricted to application servers.
- Infrastructure is managed through Terraform instead of manual configuration.
- No AWS credentials or sensitive information are stored in the repository.

---

# Skills Demonstrated

This project demonstrates practical experience with:

- Infrastructure as Code (Terraform)
- AWS Networking
- VPC Design
- Public and Private Subnet Architecture
- Linux Administration
- NGINX Configuration
- EC2 Management
- Auto Scaling
- Load Balancing
- CloudFront CDN
- Amazon RDS MySQL
- Git Version Control

---

# Future Improvements

Possible enhancements:

- Add Route 53 for custom domain management
- Add AWS Certificate Manager (ACM) HTTPS certificates
- Add CI/CD pipeline using GitHub Actions
- Add monitoring with CloudWatch
- Add centralized logging
- Add containerization using Docker and ECS/EKS

---

# Conclusion

This project demonstrates the ability to design and automate a production-style AWS three-tier architecture using Terraform.

The implementation focuses on scalability, security, availability, and repeatable infrastructure deployment following modern DevOps practices.
