resource "azurerm_user_assigned_identity" "lee_prod" {
  name                = var.user_assigned_identity_name
  resource_group_name = azurerm_resource_group.lee_prod.name
  location            = azurerm_resource_group.lee_prod.location
  tags                = var.tags
}
