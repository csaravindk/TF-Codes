variable "resource_group_name" {
  type        = string
  description = "Name of the Resource Group"
}
variable "location" {
  type        = string
  description = "Name of the location"
  
}
variable "storageaccount_name" {
  type        = string
  description = "name of the storage account"
  
}

variable "account_tier" {
  type = string
  description = "Account tier of the storage"
}

variable "account_replication_type" {
type = string
description = "Replication type of the storage account"
}

variable "account_kind" {
type = string
description = "Account kind of the storage"
}

