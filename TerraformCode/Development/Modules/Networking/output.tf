output "virtual_network_id" {
    value = azurerm_virtual_network.module-network.id
}

output "private_subnet_name" {
  value = azurerm_subnet.module-privateSubnet.name
}

output "private_subnet_id" {
  value = azurerm_subnet.module-privateSubnet.id
}

output "public_subnet_name" {
  value = azurerm_subnet.module-publicSubnet.name
}

output "public_subnet_id" {
  value = azurerm_subnet.module-publicSubnet.id
}

output "Private_endpoint_subnet_id" {
  value = azurerm_subnet.module-privatendpoint.id
}

