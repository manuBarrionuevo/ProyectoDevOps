module "vpc_virgina_norte" {
  source = "./modulos/vpc"
  vpc_vn = "10.12.0.0/16"
  subnet_private = "10.12.1.0/24"
  subnet_public = "10.12.2.0/24"
  mi_ip = ["45.191.195.199"]
}

module "Jenkins_instance" {
  source = "./modulos/ec2"
  instancias = ["Jenkins"]
  subnet_id = module.vpc_virgina_norte.private_subnet_id
}

