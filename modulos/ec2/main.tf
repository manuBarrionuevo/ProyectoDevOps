resource "aws_instance" "Jenkins_instance" {
  for_each = toset(var.instancias)
  ami = "ami-0c7217cdde317cfec"
  instance_type = "t2.micro"
  key_name = data.aws_key_pair.key.key_name
  subnet_id = var.subnet_id
  user_data = file("${path.module}/script/user_data.sh")
  vpc_security_group_ids = [var.grupo_de_seguridad]
  tags = {
    "Name" = "${each.value}"
  }
}