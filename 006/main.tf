resource "random_string" "random" {
  length  = 8
  upper   = false
  lower   = true
  special = false
}

locals {
  suffix = "p6-${random_string.random.result}"
}


resource "azurerm_resource_group" "main" {
  name     = "rg-${local.suffix}"
  location = var.location
}
