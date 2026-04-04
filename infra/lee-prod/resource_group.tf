resource "azurerm_resource_group" "lee_prod" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}