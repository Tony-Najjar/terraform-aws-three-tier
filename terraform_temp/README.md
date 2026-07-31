# AWS Three-Tier Architecture Using Terraform

## Project Overview

This project demonstrates the design and automated deployment of a highly available three-tier web application architecture on AWS using **Terraform Infrastructure as Code (IaC)**.

The infrastructure follows AWS cloud architecture best practices by separating resources into three main layers:

- **Web Layer** — NGINX web servers running on Amazon EC2
- **Application Layer** — Application Load Balancer and Auto Scaling Group for traffic distribution and availability
- **Database Layer** — Amazon RDS MySQL deployed in private subnets

The environment includes:

- Custom Amazon VPC with public and private subnets
- Internet Gateway and NAT Gateway configuration
- EC2 instances running NGINX
- Application Load Balancer (ALB)
- Auto Scaling Group for high availability
- Amazon RDS MySQL database
- Amazon CloudFront distribution
- AWS WAF protection
- CloudWatch monitoring dashboards

Terraform modules are used to organize infrastructure components into reusable and maintainable building blocks. This allows the environment to be deployed consistently through automated Infrastructure as Code practices.

---

## Architecture Overview

The architecture implements a highly available three-tier web application design on AWS.

```
Users
  |
CloudFront CDN
  |
AWS WAF
  |
Application Load Balancer
  |
Auto Scaling Group
  |
EC2 Instances running NGINX
  |
Amazon RDS MySQL
```

The infrastructure is deployed inside a custom Amazon VPC with separate public and private subnets.

### Network Layer

- Public subnets host internet-facing resources such as the Application Load Balancer.
- Private subnets host application servers and database resources.
- Internet Gateway provides inbound connectivity for public resources.
- NAT Gateway provides outbound internet access for private resources.
- Security Groups control network access between application components.

### Application Layer

- Amazon CloudFront provides global content delivery.
- AWS WAF protects the application from common web attacks.
- Application Load Balancer distributes incoming requests across EC2 instances.
- Auto Scaling Group maintains application availability by automatically adjusting EC2 capacity.
- NGINX is used as the web server running on EC2 instances.

### Database Layer

- Amazon RDS MySQL provides a managed relational database service.
- The database is deployed in private subnets to restrict direct internet access.
- Security controls limit database access to authorized application resources only.

## 1. Web Layer (Presentation Tier)

The web layer provides the entry point for users accessing the application.

- Amazon CloudFront provides global content delivery and caching.
- AWS WAF protects the application from common web attacks before traffic reaches the application servers.
- An Application Load Balancer distributes incoming requests across multiple EC2 instances.
- EC2 instances run NGINX as the web server.
- An Auto Scaling Group maintains availability by automatically managing the number of EC2 instances based on demand.

## 2. Application Layer

The application layer provides scalable compute resources that process application traffic behind the load balancer.

- EC2 instances are managed through an Auto Scaling Group to provide high availability and automatic instance replacement.
- Launch Templates define the EC2 instance configuration, including the NGINX web server setup.
- The Auto Scaling Group automatically adjusts the number of instances based on application demand.
- EC2 instances are deployed within private subnets to improve security.
- Security Groups control communication between the load balancer, application servers, and database layer.

## 3. Database Layer

The database layer provides a secure and managed data storage solution using Amazon RDS MySQL.

- Amazon RDS MySQL provides a fully managed relational database service.
- The database is deployed inside private subnets to prevent direct internet access.
- Security Groups restrict database access to authorized application resources only.
- The application layer communicates with the database through controlled network access rules.
- Terraform manages the RDS infrastructure configuration as part of the overall AWS deployment.

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

## Terraform Project Structure

This project uses a modular Terraform architecture to organize AWS infrastructure into reusable and maintainable components.

```
terraform-aws-three-tier/
│
├── modules/
│   ├── alb/             # Application Load Balancer
│   ├── autoscaling/     # EC2 Auto Scaling Group
│   ├── cloudfront/      # CloudFront distribution
│   ├── compute/         # EC2 instances and NGINX configuration
│   ├── monitoring/      # CloudWatch monitoring dashboards
│   ├── networking/      # VPC, subnets, routes, and gateways
│   ├── rds/             # Amazon RDS MySQL database
│   ├── security/        # Security groups and access controls
│   └── waf/             # AWS Web Application Firewall
│
├── main.tf              # Root Terraform module configuration
├── variables.tf         # Input variables
├── outputs.tf           # Terraform outputs
├── providers.tf         # AWS provider configuration
├── versions.tf          # Terraform and provider versions
├── backend.tf           # Terraform state backend configuration
├── screenshots/
├── README.md
└── .gitignore
```

This modular approach improves code organization, reusability, and maintainability while allowing each AWS component to be managed independently.

## Deployment Process

The infrastructure is deployed using Terraform through the following workflow.

### 1. Configure AWS Credentials

Configure AWS CLI credentials with an IAM user or role that has permissions to create the required AWS resources.

```bash
aws configure
```

### 2. Initialize Terraform

Initialize the Terraform working directory and download required providers and modules.

```bash
terraform init
```

### 3. Validate Terraform Configuration

Check the Terraform configuration for syntax and configuration errors.

```bash
terraform validate
```

### 4. Review Infrastructure Changes

Generate an execution plan to review the AWS resources Terraform will create.

```bash
terraform plan
```

### 5. Deploy Infrastructure

Apply the Terraform configuration to provision the AWS three-tier architecture.

```bash
terraform apply
```

### 6. Verify Deployment

After deployment, verify the created resources:

terraform output

The deployment creates the complete AWS environment including networking, compute resources, load balancing, security controls, monitoring, CloudFront, and the RDS MySQL database.

### 7. Destroy Infrastructure

To remove the environment when it is no longer needed:

terraform destroy


# Screenshots

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
