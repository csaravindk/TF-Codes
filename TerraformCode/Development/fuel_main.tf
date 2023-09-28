/*
module "fuel-container" {
  source = "./Modules/StorageContainer"
storage_account_id = module.dev-storageaccount.storage_account_id
container_name = "fuel-dev-container"
directory_name = "fuel-raw-dev"

}

*/

data "azurerm_client_config" "current" {}

module "fuel-keyvault" {
  source = "./Modules/Keyvault"

  keyvault_name = "fuel-dev-vault"
  resource_group_name = module.dev-resourcegroup.resource_group_name
  location = module.dev-resourcegroup.resource_group_location
  keyvault_sku =  "standard"
  keyvault_public_access_enabled_value =  "false"
}

resource "azurerm_key_vault_access_policy" "fuel-keyvault_acp1" {
  key_vault_id = module.fuel-keyvault.key_vault_id
  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = "ac5169bd-81d6-49dc-a131-128964a5b2ad"
  key_permissions = [ "Delete", "Get", "Create", "List"]
  secret_permissions = [ "Delete", "Get", "Set", "List"]
  storage_permissions = [ "Delete", "Get", "Set", "List"]
}

/*
resource "azurerm_key_vault_access_policy" "fuel-keyvault_acp2" {
  key_vault_id = module.fuel-keyvault.key_vault_id
  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = var.fuel_reader_group_id
  key_permissions = [ "get" ]
  secret_permissions = ["get" ]
  storage_permissions = ["get" ]
}

*/
module "fuel-dev-datafactory" {
  source = "./Modules/ADF"

datafactory_name = "fuel-dev-adf-001"
resource_group_name = module.dev-resourcegroup.resource_group_name
location = local.location
public_network_enabled_value = "false"
}