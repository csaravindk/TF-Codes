variable "keyvault_name" {
  type = string
  description = "name of the keyvault"
}
variable "resource_group_name" {
  type        = string
  description = "Name of the Resource Group"
}
variable "location" {
  type        = string
  description = "Name of the location"
  
}
variable "keyvault_sku" {
  type = string
  description = "tier of the vault"
}
variable "keyvault_public_access_enabled_value" {
  type = string
  description = "define it should be accessed from public network"
}