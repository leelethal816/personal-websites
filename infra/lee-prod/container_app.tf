resource "azurerm_container_app" "lee_prod" {
  name                         = var.container_app_name
  resource_group_name          = azurerm_resource_group.lee_prod.name
  container_app_environment_id = azurerm_container_app_environment.lee_prod.id
  revision_mode                = "Single"
  tags                         = var.tags

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.lee_prod.id]
  }

  registry {
    server   = azurerm_container_registry.lee_prod.login_server
    identity = azurerm_user_assigned_identity.lee_prod.id
  }

  ingress {
    external_enabled           = true
    target_port                = var.target_port
    transport                  = "auto"
    allow_insecure_connections = false
    traffic_weight {
      latest_revision = true
      percentage      = 100
    }
  }

  template {
    min_replicas = var.min_replicas
    max_replicas = var.max_replicas

    container {
      name   = "lee-site"
      image  = "${azurerm_container_registry.lee_prod.login_server}/${var.image_repository}:${var.image_tag}"
      cpu    = var.container_cpu
      memory = var.container_memory
    }
  }

  depends_on = [azurerm_role_assignment.acr_pull]
}