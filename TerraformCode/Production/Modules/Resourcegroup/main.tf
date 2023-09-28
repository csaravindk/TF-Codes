resource "azurerm_resource_group" "module-resourcegroup" {
  name = var.resource_group_name
  location = var.location
  
}