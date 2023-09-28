resource "azurerm_data_factory" "module-datafactory"{
    name = var.datafactory_name
    location = var.location
    resource_group_name = var.resource_group_name
    public_network_enabled = var.public_network_enabled_value
    identity {
      type = "SystemAssigned"
    }
}