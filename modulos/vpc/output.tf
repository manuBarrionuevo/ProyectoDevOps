output "vpc_id" {
  value = aws_vpc.vpc_virgina_norte.id
}

output "vpc_cidr" {
  value = aws_vpc.vpc_virgina_norte.cidr_block
}
output "public_subnet_id" {  # Cambié el nombre para mantener la consistencia
  value = aws_subnet.public_subnet.id
}
output "subnet_public_cidr" {
  value = aws_subnet.public_subnet.cidr_block
}

output "private_subnet_id" {
  value = aws_subnet.private_subnet.id  
}

output "subnet_private_cidr" {
  value = aws_subnet.private_subnet.cidr_block
}