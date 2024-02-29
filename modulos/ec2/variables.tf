variable "instancias" {
  description = "Nombre de las instancias"
  type = list(string)
}

variable "subnet_id" {
  description = "subnet_id de la instancia"
  type = string
}

variable "grupo_de_seguridad" {
  description = "Grupo de seguridad de la instancia"
  type = string
}
