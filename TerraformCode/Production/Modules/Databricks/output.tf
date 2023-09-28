output "databricks_workspace_id" {
  value = azurerm_databricks_workspace.module-databricks-workspace.workspace_id
}
output "databricks_workspace_resource_id" {
  value = azurerm_databricks_workspace.module-databricks-workspace.id
}