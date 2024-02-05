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
  client_id       = data.vault_azure_access_credentials.creds.client_id
  client_secret   = data.vault_azure_access_credentials.creds.client_secret
  subscription_id = var.azure_subscription_id
  tenant_id       = var.azure_tenant_id
}

data "vault_azure_access_credentials" "creds" {
  role                        = "tfc"
  backend                     = "azure"
  validate_creds              = true
  num_sequential_successes    = 8
  num_seconds_between_tests   = 1
  max_cred_validation_seconds = 300
}
