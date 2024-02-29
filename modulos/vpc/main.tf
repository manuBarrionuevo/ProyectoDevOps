
resource "aws_vpc" "vpc_virgina_norte" {
  cidr_block = var.vpc_vn
  instance_tenancy = "default"
  tags = {
    "Name" = "VPC-Project-DevOps"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.vpc_virgina_norte.id
  cidr_block = var.subnet_public
   map_public_ip_on_launch = true
  tags = {
    "Name" = "Public_subnet"
  }  
}

resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.vpc_virgina_norte.id
  cidr_block = var.subnet_private
  tags = {
    "Name" = "Private_subnet"
  } 
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

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_virgina_norte.id
  tags = {
    "Name" = "igw vpc VN"
  }
}

resource "aws_route_table" "public_crt" {
  vpc_id = aws_vpc.vpc_virgina_norte.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-crt"
  }
}

resource "aws_route_table_association" "crt_public_subnet" {
  subnet_id = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_crt.id
}