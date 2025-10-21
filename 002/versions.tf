terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.49.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.7.0"
    }
  }
}

provider "azurerm" {
  features {
  }
  subscription_id = "072b086b-63e3-454f-bba9-b1afb4e9d7f7"
}