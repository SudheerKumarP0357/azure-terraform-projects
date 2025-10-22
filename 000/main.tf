
resource "random_string" "random" {
  length  = 8
  upper   = false
  lower   = true
  special = false
}

resource "azurerm_resource_group" "main" {
  name     = "rg-terraform"
  location = var.location
}


resource "azurerm_storage_account" "main" {
  name                     = "st${random_string.random.result}"
  location                 = azurerm_resource_group.main.location
  resource_group_name      = azurerm_resource_group.main.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
resource "azurerm_storage_container" "main" {
  name                  = "tfstate"
  storage_account_id = azurerm_storage_account.main.id
  container_access_type = "private"
}