output "resource_group_name" {
  description = "Resource group name for Lee's production deployment."
  value       = azurerm_resource_group.lee_prod.name
}

output "container_registry_name" {
  description = "Azure Container Registry name for Lee's site."
  value       = azurerm_container_registry.lee_prod.name
}

output "container_registry_login_server" {
  description = "Login server for the Azure Container Registry."
  value       = azurerm_container_registry.lee_prod.login_server
}

output "container_app_environment_name" {
  description = "Container Apps environment name."
  value       = azurerm_container_app_environment.lee_prod.name
}

output "container_app_name" {
  description = "Container App name for Lee's production site."
  value       = azurerm_container_app.lee_prod.name
}

output "container_app_fqdn" {
  description = "Default Azure-generated FQDN for the Lee container app."
  value       = azurerm_container_app.lee_prod.latest_revision_fqdn
}
