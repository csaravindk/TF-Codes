locals {
  location = var.location
}

module "dev-resourcegroup" {
  source = "./Modules/Resourcegroup"
  
  location = var.location
  resource_group_name = "Dev-Rg-001"
}

module "dev-virtualnetwork" {
  source = "./Modules/Networking"

  resource_group_name = module.dev-resourcegroup.resource_group_name
  location = var.location
  virtualnetwork_name = "dev-vnet-001"
  virtualnetwork_address_space = ["15.0.0.0/20"]
  private_subnet_name = "dev-prv-snet"
  private_subnet_address_space = ["15.0.0.0/22"]
  public_subnet_name = "dev-pub-snet"
  public_subnet_address_space = ["15.0.4.0/22"]
  private_endpoint_subnet_name = "dev-prvenp-snet"
  private_endpoint_subnet_address_space = ["15.0.8.0/22"]
  nsg_name = "dev-db-nsg-001"
}


module "dev-storageaccount" {
  source = "./Modules/StorageAccount"

  resource_group_name = module.dev-resourcegroup.resource_group_name
  location = var.location
  storageaccount_name = "mydevstorage00123"
  account_kind = "StorageV2"
  account_tier = "Standard"
  account_replication_type = "LRS"
  
}

/*
module "dev-infra-container" {
  source = "./Modules/StorageContainer"
storage_account_id = module.dev-storageaccount.storage_account_id
container_name = "infracontainer"
directory_name = "infradirectory"

}

*/

module "dev-databricks_workspace" {
  source = "./Modules/Databricks"

databricks_workspace_name = "deveworkspace"
resource_group_name = module.dev-resourcegroup.resource_group_name
location = var.location
databricks_sku = "premium"
databricks_public_access_enabled_value = "true"
databricks_no_public_ip = "false"
private_subnet_name = module.dev-virtualnetwork.private_subnet_name
private_subnet_id = module.dev-virtualnetwork.private_subnet_id
public_subnet_name = module.dev-virtualnetwork.public_subnet_name
public_subnet_id = module.dev-virtualnetwork.public_subnet_id
virtual_network_id = module.dev-virtualnetwork.virtual_network_id
virtual_network_address_space = "15.0.0.0/20"
network_security_group_rules_required = "AllRules"

}

resource "azurerm_private_endpoint" "databricks_backend_pep" {
  name                = "databricksbackendpep01"
  resource_group_name = module.dev-resourcegroup.resource_group_name
  location            = var.location
  subnet_id           = module.dev-virtualnetwork.Private_endpoint_subnet_id

  private_service_connection {
    name                           = "datarbricksbepsc01"
    private_connection_resource_id = module.dev-databricks_workspace.databricks_workspace_resource_id
    is_manual_connection           = false
    subresource_names              = ["databricks_ui_api"]
  }
}

module "dev-databricks_access_connector" {
  source = "./Modules/DatabricksConnector"
  resource_group_name = module.dev-resourcegroup.resource_group_name
  location = var.location
  databricks_access_connector_name = "dev-databricks-ac-01"
  
}

resource "azurerm_role_assignment" "access_connector_role_assignment" {
  scope                = module.dev-storageaccount.storage_account_id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = module.dev-databricks_access_connector.databricks_access_connector.identity[0].principal_id
  depends_on = [ module.dev-resourcegroup ]
}

resource "azurerm_storage_data_lake_gen2_filesystem" "metastore_container" {
 name               = var.metastore_container_name
  storage_account_id = module.dev-storageaccount.storage_account_id
}


resource "databricks_metastore" "dev-metastore" {
  name = "primary_metastore"
  storage_root = format ("abfss://${var.metastore_container_name}@${module.dev-storageaccount.storage_account_name}.dfs.core.windows.net/")
  force_destroy = true
  
}

resource "databricks_metastore_data_access" "dev-metastore-access" {
  metastore_id = databricks_metastore.dev-metastore.metastore_id
  name         = "keys"
  azure_managed_identity {
    access_connector_id = module.dev-databricks_access_connector.databricks_access_connector_id
  }

  is_default = true
  depends_on = [ databricks_metastore.dev-metastore]
}

resource "databricks_metastore_assignment" "dev-metastore-assignment" {
  workspace_id         = module.dev-databricks_workspace.databricks_workspace_id
  metastore_id         = databricks_metastore.dev-metastore.metastore_id
  default_catalog_name = "hive_metastore"
  
}

resource "databricks_grants" "name" {
  volume = ""
  metastore = ""
  catalog = ""
  schema = ""
  storage_credential = ""
  external_location = ""
  connection = ""
  table = ""
share = ""
}