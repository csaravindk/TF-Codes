resource "azurerm_virtual_network" "module-network" {
  name                = var.virtualnetwork_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.virtualnetwork_address_space
  

}

resource "azurerm_subnet" "module-privateSubnet" {
  resource_group_name  = azurerm_virtual_network.module-network.resource_group_name
  name                 = var.private_subnet_name
  virtual_network_name = azurerm_virtual_network.module-network.name
  address_prefixes     = var.private_subnet_address_space
  

  delegation {
    name = "databricksprivate"

    service_delegation {
      name    = "Microsoft.Databricks/workspaces"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
    }
  }

}

resource "azurerm_subnet" "module-publicSubnet" {

  name                 = var.public_subnet_name
  resource_group_name  = azurerm_virtual_network.module-network.resource_group_name
  virtual_network_name = azurerm_virtual_network.module-network.name
  address_prefixes     = var.public_subnet_address_space
  
  delegation {
    name = "databrickspublic"

    service_delegation {
      name    = "Microsoft.Databricks/workspaces"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
    }
  }

}

resource "azurerm_subnet" "module-privatendpoint" {

  name                 = var.private_endpoint_subnet_name
  resource_group_name  = azurerm_virtual_network.module-network.resource_group_name
  virtual_network_name = azurerm_virtual_network.module-network.name
  address_prefixes     = var.private_endpoint_subnet_address_space
  private_link_service_network_policies_enabled = true
}

resource "azurerm_network_security_group" "Module-Nsg" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.resource_group_name
  }

resource "azurerm_subnet_network_security_group_association" "module-nsg-association_public" {
  subnet_id                 = azurerm_subnet.module-publicSubnet.id
  network_security_group_id = azurerm_network_security_group.Module-Nsg.id
  
}
resource "azurerm_subnet_network_security_group_association" "module-nsg-association_private" {
  subnet_id                 = azurerm_subnet.module-privateSubnet.id
  network_security_group_id = azurerm_network_security_group.Module-Nsg.id
}

