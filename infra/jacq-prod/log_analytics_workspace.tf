resource "azurerm_log_analytics_workspace" "jacq_prod" {
  name                = var.log_analytics_workspace_name
  location            = azurerm_resource_group.jacq_prod.location
  resource_group_name = azurerm_resource_group.jacq_prod.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
  tags                = var.tags
}