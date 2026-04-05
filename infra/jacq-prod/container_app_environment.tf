resource "azurerm_container_app_environment" "jacq_prod" {
  name                       = var.container_app_environment_name
  location                   = azurerm_resource_group.jacq_prod.location
  resource_group_name        = azurerm_resource_group.jacq_prod.name
  log_analytics_workspace_id = azurerm_log_analytics_workspace.jacq_prod.id
  logs_destination           = "log-analytics"
  tags                       = var.tags
}