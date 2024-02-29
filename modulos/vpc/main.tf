
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

resource "aws_security_group" "Jenkins_SG" {
  vpc_id = aws_vpc.vpc_virgina_norte.id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [var.mi_ip]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}