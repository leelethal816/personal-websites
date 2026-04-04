resource "azurerm_log_analytics_workspace" "lee_prod" {
  name                = var.log_analytics_workspace_name
  location            = azurerm_resource_group.lee_prod.location
  resource_group_name = azurerm_resource_group.lee_prod.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
  tags                = var.tags
}