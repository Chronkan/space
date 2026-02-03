variable "name" {
  type = string
}

variable "cidr_block_vpc" {
  type = string
}

variable "dns_true" {
  type = string
}

variable "vpc_public_subnet" {
  type = string
}

variable "region" {
  type = string
}

variable "tags" {
  type = map(string)
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

variable "rds_private_subnet_one" {
  type = string
}

variable "rds_private_subnet_two" {
  type = string
}
