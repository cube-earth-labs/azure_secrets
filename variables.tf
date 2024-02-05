variable "resource_group_location" {
  type        = string
  default     = "eastus"
  description = "Location of the resource group."
}

variable "resource_group_name" {
  type        = string
  default     = "azure-secrets-rg"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "azure_subscription_id" {
  type        = string
  description = "The Azure Subscription ID"
}

variable "azure_tenant_id" {
  type        = string
  description = "The Azure Tenant ID"
}
