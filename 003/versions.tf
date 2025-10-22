terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.49.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.7.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.1.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5.3"
    }
  }
  backend "azurerm" {
    resource_group_name   = "rg-terraform"
    storage_account_name  = "sttswu3md7"
    container_name        = "tfstate"
    key                   = "003-p3.tfstate"
  }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
  subscription_id = "072b086b-63e3-454f-bba9-b1afb4e9d7f7"
}