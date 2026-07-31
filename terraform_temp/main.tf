module "networking" {
  source = "./modules/networking"

  project_name = var.project_name
  vpc_cidr     = var.vpc_cidr

  public_subnet_1  = var.public_subnet_1
  public_subnet_2  = var.public_subnet_2
  private_subnet_1 = var.private_subnet_1
  private_subnet_2 = var.private_subnet_2
}
module "security" {
  source = "./modules/security"

  project_name = var.project_name
  vpc_id       = module.networking.vpc_id
}
module "compute" {
  source = "./modules/compute"

  project_name      = var.project_name
  security_group_id = module.security.web_security_group_id
  instance_type     = var.instance_type
}
module "alb" {
  source = "./modules/alb"

  project_name = var.project_name
  vpc_id       = module.networking.vpc_id

  public_subnet_1 = module.networking.public_subnet_1_id
  public_subnet_2 = module.networking.public_subnet_2_id

  alb_security_group_id = module.security.alb_security_group_id
}
module "cloudfront" {

  source = "./modules/cloudfront"

  project_name = var.project_name

  alb_dns_name = module.alb.alb_dns_name

  web_acl_id = module.waf.web_acl_arn

}
module "waf" {

  source = "./modules/waf"

  project_name = var.project_name



}
module "monitoring" {

  source = "./modules/monitoring"

  project_name = var.project_name

  alb_arn_suffix = module.alb.alb_arn_suffix

  rds_instance_id = module.rds.database_name

  email = var.alert_email

}
module "autoscaling" {
  source = "./modules/autoscaling"

  project_name = var.project_name

  launch_template_id = module.compute.launch_template_id

  private_subnet_1 = module.networking.private_subnet_1_id
  private_subnet_2 = module.networking.private_subnet_2_id

  target_group_arn = module.alb.target_group_arn
  desired_capacity = 2
  min_size         = 2
  max_size         = 4
}
module "rds" {
  source = "./modules/rds"

  project_name = var.project_name

  private_subnet_1 = module.networking.private_subnet_1_id
  private_subnet_2 = module.networking.private_subnet_2_id

  database_security_group_id = module.security.database_security_group_id

  db_username = var.db_username
  db_password = var.db_password
}

