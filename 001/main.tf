
resource "random_string" "random" {
  length  = 8
  upper   = false
  lower   = true
  special = false
}

resource "azurerm_resource_group" "main" {
  name     = "rg-p1-${random_string.random.result}"
  location = var.location
}


resource "azurerm_storage_account" "main" {
  name                     = "stp1${random_string.random.result}"
  location                 = azurerm_resource_group.main.location
  resource_group_name      = azurerm_resource_group.main.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_log_analytics_workspace" "main" {
  name                = "log-p1-${random_string.random.result}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  sku                 = "PerGB2018"
  retention_in_days   = 30

}