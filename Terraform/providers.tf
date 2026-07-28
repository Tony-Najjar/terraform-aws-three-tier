provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "Terraform AWS Three Tier"
      Environment = "Dev"
      ManagedBy   = "Terraform"
    }
  }
}
