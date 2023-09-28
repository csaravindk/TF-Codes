variable "location" {
  type = string
  default = "North Europe"
  description = "location of the resource"
}

variable "metastore_container_name" {
  type = string
  default = "prodmetastore"
  description = "name of the metastore"
}