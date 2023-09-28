variable "resource_group_name" {
  type        = string
  description = "Name of the Resource Group"
}
variable "location" {
  type        = string
  description = "Name of the location"
}
variable "virtualnetwork_name" {
  type = string 
  description = "name of the virtual network"
}

variable "virtualnetwork_address_space" {
  type = list(string)
  description = "virtual network CIDR"
}

variable "private_subnet_name" {
  type        = string
  description = "Name of the private Subnet"
}

variable "private_subnet_address_space" {
  type = list 
  description = "private subnet CIDR"
}

variable "public_subnet_name" {
  type        = string
  description = "Name of the public Subnet"
}

variable "public_subnet_address_space" {
  type = list 
  description = "public subnet CIDR"
}

variable "private_endpoint_subnet_name" {
  type        = string
  description = "Name of the private endpoint Subnet"
}

variable "private_endpoint_subnet_address_space" {
  type = list 
  description = "private endpoint subnet CIDR"
}

variable "nsg_name" {
  type        = string
  description = "name of the network security group"
}
