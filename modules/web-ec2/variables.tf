variable "name" {
  type    = string
  default = "web-Nginx"
}

variable "vpc_id" {
  type = string
}

variable "subnet_id" {
  type = string

}

variable "instance_type" {
  type = string
}

variable "ami_id" {
  type    = string
  default = ""
}

variable "allow_ssh" {
  type = bool
}

variable "tags" {
  type = map(string)
}

variable "ingress_http_cidr" {
  type = string
}

variable "ingress_https_cidr" {
  type = string
}

variable "ingress_ssh_cidr" {
  type = string
}

variable "region" {
  type = string
}

variable "cidr_block_vpc" {
  type = string

}

variable "alb_public_subnet_one" {
  type = string

}

variable "alb_public_subnet_two" {
  type = string
}

variable "rds_private_subnet_one" {
  type = string

}

variable "rds_private_subnet_two" {
  type = string
}

variable "ec2_private_subnet_one" {
  type = string
}

variable "ec2_private_subnet_two" {
  type = string
}

variable "vpc_public_subnet" {
  type = string
}
