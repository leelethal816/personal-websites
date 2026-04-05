resource "azurerm_user_assigned_identity" "jacq_prod" {
  name                = var.user_assigned_identity_name
  resource_group_name = azurerm_resource_group.jacq_prod.name
  location            = azurerm_resource_group.jacq_prod.location
  tags                = var.tags
}
