variable "vpc_vn" {
  description = "CIDR vpn Virgina del Norte"
  type = string
}
variable "subnet_public" {
  description = "CIDR subnet publica"
  type = string
}

variable "subnet_private" {
  description = "CIDR subnet privada"
  type = string
}

variable "mi_ip" {
  description = "Mi dirección ip"
  type = string
}