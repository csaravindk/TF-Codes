terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.70.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = ">=2.41.0"
    }
    databricks = {
      source  = "databricks/databricks"
      version = ">=1.19.0"
    }
  }
   backend "azurerm" {
    resource_group_name = "Devops"
    storage_account_name = "mydevopsstorage4786"
    container_name = "import"
    key = "importterraform.tfstate"
  }
}


provider "azurerm" {
  
  subscription_id = "2e932ad9-643e-4fd3-8c74-f121b235d920"
  tenant_id       = "7a6720b2-b0ac-493c-8c20-09e1f6028803"
  client_id       = "137ed1e2-8ec2-4c0d-947f-04ddba795872"
  client_secret   = "GjD8Q~5em5BWJ2ioKqqsgW3gj3zjHuZHNSqNibSW"
  features {}
  skip_provider_registration = true
  
}

provider "azuread" {
  use_cli       = "false"
  tenant_id       = "7a6720b2-b0ac-493c-8c20-09e1f6028803"
  client_id       = "137ed1e2-8ec2-4c0d-947f-04ddba795872"
  client_secret   = "GjD8Q~5em5BWJ2ioKqqsgW3gj3zjHuZHNSqNibSW"
}


provider "databricks" {
   azure_tenant_id             = data.azurerm_client_config.current.tenant_id
  azure_client_id             = data.azurerm_client_config.current.client_id
  azure_client_secret         = "GjD8Q~5em5BWJ2ioKqqsgW3gj3zjHuZHNSqNibSW"
  #auth_type  = "azure-client-secret"
azure_workspace_resource_id = module.dev-databricks_workspace.databricks_workspace_resource_id
}

/*
resource "azurerm_role_assignment" "aravind" {
  scope                = azurerm_resource_group.applicationrg.id
  role_definition_name = "owner"
  principal_id         = "739e964a-7af4-4c96-bdef-a676da8f868a"
}
*/
