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

variable "arm_subscription_id" {
  type        = string
  description = "The Azure Subscription ID"
}
variable "arm_tenant_id" {
  type        = string
  description = "The Azure Tenant ID"
}
variable "arm_client_id" {
  type        = string
  description = "The Azure Client ID"
}
variable "arm_client_secret" {
  type        = string
  description = "The Azure Client Secret"
}
