resource "azurerm_databricks_access_connector" "module-databricks_access_connector" {
  name                = var.databricks_access_connector_name
  resource_group_name = var.resource_group_name
  location            = var.location

  identity {
    type = "SystemAssigned"
  }
}