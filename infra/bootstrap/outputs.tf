output "backend_resource_group_name" {
  description = "Resource group name for the Terraform backend."
  value       = azurerm_resource_group.tfstate.name
}

output "backend_storage_account_name" {
  description = "Storage account name for the Terraform backend."
  value       = azurerm_storage_account.tfstate.name
}

output "backend_container_name" {
  description = "Blob container name for the Terraform backend."
  value       = azurerm_storage_container.tfstate.name
}

output "backend_state_key" {
  description = "Recommended state key name for the future Lee production stack."
  value       = "lee-prod.tfstate"
}
