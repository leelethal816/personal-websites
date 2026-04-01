terraform {
  backend "azurerm" {
    resource_group_name  = "rg-leenuxos"
    storage_account_name = "leenuxostfstate816"
    container_name       = "tfstate"
    key                  = "lee-prod.tfstate"
  }
}
