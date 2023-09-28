variable "container_name" {
type = string
description = "Name of the container"
}

variable "raw_directory_name" {
type = string
description = "Name of the directory"  
}

variable "protected_directory_name" {
type = string
description = "Name of the directory"  
}

variable "purpose_directory_name" {
type = string
description = "Name of the directory"  
}


variable "storage_account_id" {
  type = string
  description = "Id of the storage account"
}
variable "domain_contributor_gruoup_id" {
  type = string
  description = "Id of the domain contributor group"
}

variable "domain_reader_gruoup_id" {
  type = string
  description = "Id of the domain reader group"
}

variable "subdomain_raw_reader_group_id" {
  type = string
  description = "Id of the subdomain -raw reader group"
}

variable "subdomain_raw_contributor_group_id" {
  type = string
  description = "Id of the subdomain -raw contributor group"
}

variable "subdomain_protected_reader_group_id" {
  type = string
  description = "Id of the subdomain -protected reader group"
}

variable "subdomain_protected_contributor_group_id" {
  type = string
  description = "Id of the subdomain -protected contributor group"
}

variable "subdomain_purpose_reader_group_id" {
  type = string
  description = "Id of the subdomain -purpose reader group"
}

variable "subdomain_purpose_contributor_group_id" {
  type = string
  description = "Id of the subdomain -purpose contributor group"
}