variable "region" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "cidr_block_vpc" {
  type = string

}

variable "vpc__public_subnet" {
  type = string
}

variable "sns_endpoint" {
  type = string
}

variable "instance_id" {
  type = string
}

variable "name" {
  type = string
}

variable "dns_true" {
  type = bool
}

variable "alb_public_subnet_one" {
  type = string
}
variable "alb_public_subnet_two" {
  type = string
}
variable "ec2_private_subnet_one" {
  type = string
}
variable "ec2_private_subnet_two" {
  type = string
}
variable "ingress_http_cidr" {
  type = string
}
variable "ingress_https_cidr" {
  type = string
}
variable "rds_private_subnet_one" {
  type = string
}
variable "rds_private_subnet_two" {
  type = string
}
variable "ingress_ssh_cidr" {
  type = string
}
variable "allow_ssh" {
  type = bool
}
variable "ami_id" {
  type = string
}
variable "instance_type" {
  type = string
}
