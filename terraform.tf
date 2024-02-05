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
}
