region = "eu-north-1"

tags = {
  CostAllocation = "xxx"
  Ownership      = "dev-team"
  project        = "test-project"
  environment    = "development"

}

sns_endpoint = "sebastian.jarrett@hotmail.com"

instance_id = ""

name = ""

## VPC MODULE VALUES 

cidr_block_vpc = "10.0.1.0/24"

dns_true = true

vpc__public_subnet = "10.0.1.64/26"

alb_public_subnet_one = "10.0.1.0/27"

alb_public_subnet_two = "10.0.1.32/27"

ec2_private_subnet_one = "10.0.1.64/27"

ec2_private_subnet_two = "10.0.1.96/27"

rds_private_subnet_one = "10.0.1.128/27"

rds_private_subnet_two = "10.0.1.160/27"

## WEB-EC2 MODULE VALUES

ingress_ssh_cidr = "0.0.0.0/0"

ingress_http_cidr = "0.0.0.0/0"

ingress_https_cidr = "0.0.0.0/0"

allow_ssh = false

instance_type = "t3.micro"

ami_id = ""
