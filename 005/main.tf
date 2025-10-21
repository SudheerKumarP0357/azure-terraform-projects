resource "random_string" "random" {
  length  = 8
  upper   = false
  lower   = true
  special = false
}

resource "azurerm_resource_group" "main" {
  name     = "rg-p5-${random_string.random.result}"
  location = var.location
}
