resource "azurerm_container_registry" "lee_prod" {
  name                          = var.container_registry_name
  resource_group_name           = azurerm_resource_group.lee_prod.name
  location                      = azurerm_resource_group.lee_prod.location
  sku                           = "Basic"
  admin_enabled                 = false
  public_network_access_enabled = true
  tags                          = var.tags
}
