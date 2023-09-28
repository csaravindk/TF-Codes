variable "resource_group_name" {
  type        = string
  description = "Name of the Resource Group"
}
variable "location" {
  type        = string
  description = "Name of the location"
  
}
variable "datafactory_name" {
    type = string
    description = "name of the datafactory"
  
}
variable "public_network_enabled_value" {
  type = string
  description = "define if public endpoint to be enabled or not"
}