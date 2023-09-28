data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "module_keyvault" {
  name                        = var.keyvault_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  sku_name                    = var.keyvault_sku
  public_network_access_enabled = var.keyvault_public_access_enabled_value
}