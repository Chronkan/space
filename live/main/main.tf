module "vpc" {

  source                 = "../../modules/vpc"
  name                   = "main"
  cidr_block_vpc         = var.cidr_block_vpc
  region                 = var.region
  ec2_private_subnet_one = var.ec2_private_subnet_one
  ec2_private_subnet_two = var.ec2_private_subnet_two
  rds_private_subnet_one = var.rds_private_subnet_one
  rds_private_subnet_two = var.rds_private_subnet_two
  alb_public_subnet_one  = var.alb_public_subnet_one
  alb_public_subnet_two  = var.alb_public_subnet_two
  vpc_public_subnet      = var.vpc__public_subnet
  dns_true               = var.dns_true

  tags = var.tags
}

module "web" {
  source                 = "../../modules/web-ec2"
  name                   = "main"
  region                 = module.vpc.region
  vpc_id                 = module.vpc.id
  subnet_ids             = module.vpc.public_subnet_id
  instance_type          = var.instance_type
  allow_ssh              = var.allow_ssh
  rds_private_subnet_one = var.rds_private_subnet_one
  rds_private_subnet_two = var.rds_private_subnet_two
  alb_public_subnet_one  = var.alb_public_subnet_one
  alb_public_subnet_two  = var.alb_public_subnet_two
  ec2_private_subnet_one = var.ec2_private_subnet_one
  ec2_private_subnet_two = var.ec2_private_subnet_two
  ingress_http_cidr      = var.ingress_http_cidr
  ingress_https_cidr     = var.ingress_https_cidr
  ingress_ssh_cidr       = var.ingress_ssh_cidr
  vpc_public_subnet      = var.vpc__public_subnet
  cidr_block_vpc         = var.cidr_block_vpc

  tags = var.tags
}

module "cloudwatch" {
  source       = "../../modules/cloudwatch"
  region       = var.region
  sns_endpoint = var.sns_endpoint
  instance_id  = module.web.instance_id
}
