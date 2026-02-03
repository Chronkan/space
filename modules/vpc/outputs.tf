output "vpc_id" {
    value = aws_vpc.main.id 
  
}

output "id" {
    value = aws_vpc.main.id 
  
}

output "region" {
    value = var.region
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.id 
}