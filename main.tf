module "vpc_virgina_norte" {
  source = "./modulos/vpc"
  vpc_vn = "10.12.0.0/16"
  subnet_private = "10.12.1.0/24"
  subnet_public = "10.12.2.0/24"
}
