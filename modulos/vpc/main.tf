
resource "aws_vpc" "vpc_virgina_norte" {
  cidr_block = var.vpc_vn
  instance_tenancy = "default"
}

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.vpc_virgina_norte.id
  cidr_block = var.subnet_public  
}

resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.vpc_virgina_norte.id
  cidr_block = var.subnet_private
}