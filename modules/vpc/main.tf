resource "aws_vpc" "main" {
    cidr_block = var.cidr_block_vpc
    enable_dns_support = var.dns_true
    enable_dns_hostnames = var.dns_true
    tags = var.tags
  
}

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.vpc_public_subnet
  map_public_ip_on_launch = false

  tags = var.tags
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags   = var.tags
}

resource "aws_route_table" "public_route" {
    vpc_id = aws_vpc.main.id 

    tags = var.tags
  
}

resource "aws_route" "default_route_inet" {
    route_table_id = aws_route_table.public_route.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id 
  
}

resource "aws_route_table_association" "public_route" {
    route_table_id = aws_route_table.public_route.id
    subnet_id = aws_subnet.public_subnet.id 
  
}