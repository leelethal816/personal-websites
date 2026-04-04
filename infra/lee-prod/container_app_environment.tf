resource "azurerm_container_app_environment" "lee_prod" {
  name                       = var.container_app_environment_name
  location                   = azurerm_resource_group.lee_prod.location
  resource_group_name        = azurerm_resource_group.lee_prod.name
  log_analytics_workspace_id = azurerm_log_analytics_workspace.lee_prod.id
  logs_destination           = "log-analytics"
  tags                       = var.tags
}