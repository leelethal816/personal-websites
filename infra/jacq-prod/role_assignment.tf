resource "azurerm_role_assignment" "acr_pull" {
  scope                = azurerm_container_registry.jacq_prod.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_user_assigned_identity.jacq_prod.principal_id
}
