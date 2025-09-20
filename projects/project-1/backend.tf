terraform {
  backend "azurerm" {
    container_name       = "terraform-state"
    storage_account_name = "backendterraform6"
    key                  = "terraform.tfstate"
    resource_group_name = "backend-rg"
  }
}