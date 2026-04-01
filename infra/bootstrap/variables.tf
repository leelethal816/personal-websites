variable "subscription_id" {
  description = "Azure subscription ID that will host the Terraform state backend."
  type        = string
}

variable "location" {
  description = "Azure region for the Terraform state backend resources."
  type        = string
  default     = "South Central US"
}

variable "resource_group_name" {
  description = "Resource group name for the Terraform state backend."
  type        = string
  default     = "rg-leenuxos"
}

variable "storage_account_name" {
  description = "Globally unique Azure Storage account name for Terraform state."
  type        = string
  default     = "leenuxostfstate816"
}

variable "container_name" {
  description = "Blob container name for Terraform state."
  type        = string
  default     = "tfstate"
}

variable "tags" {
  description = "Tags applied to backend resources."
  type        = map(string)
  default = {
    project     = "leenuxos"
    environment = "prod"
    managed_by  = "terraform"
    stack       = "bootstrap"
  }
}
