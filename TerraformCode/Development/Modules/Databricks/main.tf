
resource "azurerm_databricks_workspace" "module-databricks-workspace" {
  name                                  = var.databricks_workspace_name
  resource_group_name                   = var.resource_group_name
  location                              = var.location
  sku                                   = var.databricks_sku
  managed_resource_group_name           = "${var.databricks_workspace_name}-managed-rg"
  infrastructure_encryption_enabled     = "false"
  customer_managed_key_enabled          = "false"
  public_network_access_enabled         = var.databricks_public_access_enabled_value
  network_security_group_rules_required = var.network_security_group_rules_required

  custom_parameters {
    no_public_ip                                         = var.databricks_no_public_ip
    public_subnet_name                                   = var.public_subnet_name
    public_subnet_network_security_group_association_id  = var.public_subnet_id
    private_subnet_name                                  = var.private_subnet_name
    private_subnet_network_security_group_association_id = var.private_subnet_id
    virtual_network_id                                   = var.virtual_network_id
    vnet_address_prefix                                  = var.virtual_network_address_space
  }
 
    
  }


