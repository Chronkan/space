locals {
    name = var.name 
}

data "aws_ami" "al_latest" {
  count = var.ami_id == "" ? 1 : 0
  most_recent = true
  owners = ["137112412989"]

  filter {
    name = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name = "architecture"
    values = ["x86_64"]
  }

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name = "root-device-type"
    values = ["ebs"]
  }
}

resource "aws_security_group" "web_sg" {
    name = "${local.name}-web-sg"
    vpc_id = var.vpc_id
    description = var.allow_ssh ? "Allow HTTP/HTTPS and SSH" : "Allow HTTP/HTTPS"
  
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_ipv4" {
    description = "Ingress HTTP"
    security_group_id = aws_security_group.web_sg.id
    from_port = 80
    to_port = 80
    ip_protocol = "tcp"
    cidr_ipv4 = var.ingress_http_cidr
  
}

resource "aws_vpc_security_group_ingress_rule" "allow_https_ipv4" {
    description = "Ingress HTTPS"
    security_group_id = aws_security_group.web_sg.id 
    ip_protocol = "tcp"
    from_port = 443
    to_port = 443
    cidr_ipv4 = var.ingress_https_cidr 
  
}

resource "aws_vpc_security_group_ingress_rule" "ssh" {
    count = var.allow_ssh ? 1 : 0
    security_group_id = aws_security_group.web_sg.id
    
    description = "Allow/Deny SSH"
    from_port = 22
    to_port = 22
    ip_protocol = "tcp"
    cidr_ipv4 = "0.0.0.0/0"
  
}

resource "aws_instance" "web" {
    ami = var.ami_id != "" ? var.ami_id : data.aws_ami.al_latest[0].id 
    instance_type = var.instance_type
    subnet_id = var.subnet_ids
    associate_public_ip_address = true
    vpc_security_group_ids = [aws_security_group.web_sg.id]

    user_data_base64 = base64encode(templatefile("${path.module}/user_data.sh", {}))
    
  
}