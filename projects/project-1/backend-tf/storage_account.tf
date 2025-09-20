
resource "random_integer" "backend_random_number" {
  max = 6
  min = 3
}

resource "azurerm_storage_account" "backend" {
  name                     = "${var.storage_account_name}${random_integer.backend_random_number.result}"
  location                 = var.location
  resource_group_name      = azurerm_resource_group.backend.name
  account_replication_type = "LRS"
  account_tier             = "Standard"
  account_kind             = "StorageV2"
  tags                     = var.resource_group_tags
  routing {
    choice = "MicrosoftRouting"
  }
  access_tier              = "Hot"
  large_file_share_enabled = true
  blob_properties {
    delete_retention_policy {
      days                     = 7
      permanent_delete_enabled = false
    }
    container_delete_retention_policy {
      days = 7
    }
  }
}

resource "azurerm_storage_container" "backend-container" {
  name                  = "terraform-state"
  container_access_type = "container"
  storage_account_id    = azurerm_storage_account.backend.id
}
