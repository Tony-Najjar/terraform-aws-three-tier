output "alb_dns_name" {
  description = "Application Load Balancer DNS name"
  value       = module.alb.alb_dns_name
}

output "rds_endpoint" {
  description = "RDS database endpoint"
  value       = module.rds.database_endpoint
  sensitive   = true
}

output "vpc_id" {
  description = "VPC ID"
  value       = module.networking.vpc_id
}
output "target_group_arn" {
  description = "ALB target group ARN"
  value       = module.alb.target_group_arn
}
output "cloudfront_domain_name" {

  description = "CloudFront distribution domain"

  value = module.cloudfront.cloudfront_domain_name

}
output "cloudfront_distribution_arn" {
  value = module.cloudfront.cloudfront_distribution_arn
}
