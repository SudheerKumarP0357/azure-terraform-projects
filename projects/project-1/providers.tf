terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.40.0"
    }
  }
  required_version = "~>1.13.1"
}

provider "azurerm" {
  features {}
}
