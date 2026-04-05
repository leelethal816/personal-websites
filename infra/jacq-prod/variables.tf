variable "subscription_id" {
  description = "Azure subscription ID for the Lee production deployment."
  type        = string
}

variable "location" {
  description = "Azure region for the Lee production deployment."
  type        = string
  default     = "South Central US"
}

variable "resource_group_name" {
  description = "Resource group for the Jacq production workload."
  type        = string
  default     = "rg-leenuxos-jacq-prod"
}

variable "container_registry_name" {
  description = "Globally unique Azure Container Registry name for Jacq's site image."
  type        = string
  default     = "leenuxosjacqacr816"
}

variable "container_app_environment_name" {
  description = "Azure Container Apps environment name for Jacq's production site."
  type        = string
  default     = "cae-leenuxos-jacq-prod"
}

variable "container_app_name" {
  description = "Azure Container App name for Jacq's production site."
  type        = string
  default     = "ca-leenuxos-jacq-prod"
}

variable "log_analytics_workspace_name" {
  description = "Log Analytics workspace name for Container Apps diagnostics."
  type        = string
  default     = "log-leenuxos-jacq-prod"
}

variable "user_assigned_identity_name" {
  description = "User-assigned managed identity name used for ACR pull access."
  type        = string
  default     = "id-leenuxos-jacq-prod"
}

variable "image_repository" {
  description = "ACR repository name for the Jacq site image."
  type        = string
  default     = "jacq-site"
}

variable "image_tag" {
  description = "Image tag to deploy for the Jacq site."
  type        = string
  default     = "latest"
}

variable "target_port" {
  description = "Container port exposed by the nginx image."
  type        = number
  default     = 80
}

variable "container_cpu" {
  description = "vCPU allocation for the Jacq container app."
  type        = number
  default     = 0.25
}

variable "container_memory" {
  description = "Memory allocation for the Jacq container app."
  type        = string
  default     = "0.5Gi"
}

variable "min_replicas" {
  description = "Minimum number of replicas for the Jacq container app."
  type        = number
  default     = 1
}

variable "max_replicas" {
  description = "Maximum number of replicas for the Jacq container app."
  type        = number
  default     = 2
}

variable "tags" {
  description = "Tags applied to Jacq production resources."
  type        = map(string)
  default = {
    project     = "leenuxos"
    workload    = "jacq-site"
    environment = "prod"
    managed_by  = "terraform"
  }
}
