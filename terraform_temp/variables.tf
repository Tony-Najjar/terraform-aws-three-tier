variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project Name"
  type        = string
  default     = "three-tier"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_1" {
  type    = string
  default = "10.0.1.0/24"
}

variable "public_subnet_2" {
  type    = string
  default = "10.0.2.0/24"
}

variable "private_subnet_1" {
  type    = string
  default = "10.0.11.0/24"
}

variable "private_subnet_2" {
  type    = string
  default = "10.0.12.0/24"
}
variable "instance_type" {
  type    = string
  default = "t2.micro"
}
variable "db_username" {
  type = string
}

variable "db_password" {
  type      = string
  sensitive = true
}
variable "alert_email" {

  type = string

}
