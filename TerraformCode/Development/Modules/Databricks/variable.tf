variable "databricks_workspace_name" {
  type        = string
  description = "name of the workspace"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the Resource Group"
}
variable "location" {
  type        = string
  description = "Name of the location"
  
}

variable "databricks_sku" {
  type = string
  description = "tier of databricks"
}

variable "databricks_public_access_enabled_value" {
  type = string
  description = "define it should be accessed from public network"
}

variable "databricks_no_public_ip" {
    type = string
    description = "define public ip access can be allowed"
  
}

variable "network_security_group_rules_required" {
  type = string
  description = "AllRules or NoAzureDatabricksRule or NoAzureServiceRules"
}

variable "private_subnet_name" {
  type        = string
  description = "Name of the private Subnet"
}

variable "public_subnet_name" {
  type        = string
  description = "Name of the public Subnet"
}

variable "virtual_network_id" {
  type        = string
  description = "id of the virtual network"
}

variable "virtual_network_address_space" {
  type = string
  description = "virtual network CIDR"
}

variable "public_subnet_id" {
  type = string
  description = "id of the public subnet"
  
}

variable "private_subnet_id" {
  type = string
  description = "id of the private subnet"
  
}