terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "~> 3.24.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.90.0"
    }
  }

  cloud {
    organization = "ericreeves-demo"
    hostname     = "app.terraform.io"

    workspaces {
      name = "azure_secrets"
    }
  }
}

provider "vault" {}

provider "azurerm" {
  features {}
  client_id       = var.arm_client_id
  client_secret   = var.arm_client_secret
  subscription_id = var.arm_subscription_id
  tenant_id       = var.arm_tenant_id
  # client_id       = data.vault_azure_access_credentials.creds.client_id
  # client_secret   = data.vault_azure_access_credentials.creds.client_secret
  # subscription_id = var.AZURE_SUBSCRIPTION_ID
  # tenant_id       = var.AZURE_TENANT_ID

}

data "vault_azure_access_credentials" "creds" {
  role                        = "tfc"
  backend                     = "azure"
  validate_creds              = true
  num_sequential_successes    = 20
  num_seconds_between_tests   = 2
  max_cred_validation_seconds = 1200
}
