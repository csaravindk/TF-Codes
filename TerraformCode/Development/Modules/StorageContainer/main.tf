/*
resource "azurerm_storage_data_lake_gen2_filesystem" "module_container" {
  name               = var.container_name
  storage_account_id = var.storage_account_id
  ace {
    type = "group"
    scope = "access"
    id = var.domain_contributor_gruoup_id
    permissions = "rwx"
  }
  ace {
    type = "group"
    scope = "default"
    id = var.domain_contributor_gruoup_id
    permissions = "rwx"
  }
ace {
    type = "group"
    scope = "access"
    id = var.domain_reader_gruoup_id
    permissions = "r-x"
  }
  ace {
    type = "group"
    scope = "default"
    id = var.domain_reader_gruoup_id
    permissions = "r-x"
  }

ace {
    type = "group"
    scope = "access"
    id = var.subdomain_raw_reader_group_id
    permissions = "r-x"

}
ace {
    type = "group"
    scope = "access"
    id = var.subdomain_raw_contributor_group_id
    permissions = "r-x"

}
ace {
    type = "group"
    scope = "access"
    id = var.subdomain_protected_reader_group_id
    permissions = "r-x"

}
ace {
    type = "group"
    scope = "access"
    id = var.subdomain_protected_contributor_group_id
    permissions = "r-x"

}
ace {
    type = "group"
    scope = "access"
    id = var.subdomain_purpose_reader_group_id
    permissions = "r-x"

}
ace {
    type = "group"
    scope = "access"
    id = var.subdomain_purpose_contributor_group_id
    permissions = "r-x"

}
}


resource "azurerm_storage_data_lake_gen2_path" "module_raw_directory" {
  path               = var.raw_directory_name
  filesystem_name    = azurerm_storage_data_lake_gen2_filesystem.module_container.name
  storage_account_id = var.storage_account_id
  resource           = "directory"
ace {
    type = "group"
    scope = "access"
    id =  var.subdomain_raw_contributor_group_id
    permissions = "rwx"
  }
  ace {
    type = "group"
    scope = "default"
    id = var.subdomain_raw_contributor_group_id
    permissions = "rwx"
  }
  ace {
    type = "group"
    scope = "access"
    id = var.subdomain_raw_reader_group_id
    permissions = "r-x"
  }
ace {
    type = "group"
    scope = "default"
    id = var.subdomain_raw_reader_group_id
    permissions = "r-x"
  }
}

resource "azurerm_storage_data_lake_gen2_path" "module_raw_directory" {
  path               = var.raw_directory_name
  filesystem_name    = azurerm_storage_data_lake_gen2_filesystem.module_container.name
  storage_account_id = var.storage_account_id
  resource           = "directory"
ace {
    type = "group"
    scope = "access"
    id =  var.subdomain_raw_contributor_group_id
    permissions = "rwx"
  }
  ace {
    type = "group"
    scope = "default"
    id = var.subdomain_raw_contributor_group_id
    permissions = "rwx"
  }
  ace {
    type = "group"
    scope = "access"
    id = var.subdomain_raw_reader_group_id
    permissions = "r-x"
  }
ace {
    type = "group"
    scope = "default"
    id = var.subdomain_raw_reader_group_id
    permissions = "r-x"
  }
}

resource "azurerm_storage_data_lake_gen2_path" "module_protected_directory" {
  path               = var.protected_directory_name
  filesystem_name    = azurerm_storage_data_lake_gen2_filesystem.module_container.name
  storage_account_id = var.storage_account_id
  resource           = "directory"
ace {
    type = "group"
    scope = "access"
    id =  var.subdomain_protected_contributor_group_id
    permissions = "rwx"
  }
  ace {
    type = "group"
    scope = "default"
    id = var.subdomain_protected_contributor_group_id
    permissions = "rwx"
  }
  ace {
    type = "group"
    scope = "access"
    id = var.subdomain_protected_reader_group_id
    permissions = "r-x"
  }
ace {
    type = "group"
    scope = "default"
    id = var.subdomain_protected_reader_group_id
    permissions = "r-x"
  }
}


resource "azurerm_storage_data_lake_gen2_path" "module_purpose_directory" {
  path               = var.purpose_directory_name
  filesystem_name    = azurerm_storage_data_lake_gen2_filesystem.module_container.name
  storage_account_id = var.storage_account_id
  resource           = "directory"
ace {
    type = "group"
    scope = "access"
    id =  var.subdomain_purpose_contributor_group_id
    permissions = "rwx"
  }
  ace {
    type = "group"
    scope = "default"
    id = var.subdomain_purpose_contributor_group_id
    permissions = "rwx"
  }
  ace {
    type = "group"
    scope = "access"
    id = var.subdomain_purpose_reader_group_id
    permissions = "r-x"
  }
ace {
    type = "group"
    scope = "default"
    id = var.subdomain_purpose_reader_group_id
    permissions = "r-x"
  }
}
*/