resource "random_string" "random" {
  length  = 8
  upper   = false
  lower   = true
  special = false
}

resource "azurerm_resource_group" "main" {
  name     = "rg-p3-${random_string.random.result}"
  location = var.location
}

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "main" {
  name                     = "kv-p3-${random_string.random.result}"
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  tenant_id                = data.azurerm_client_config.current.tenant_id
  purge_protection_enabled = false

  sku_name = "standard"
}


resource "azurerm_key_vault_access_policy" "terraform_user" {
  key_vault_id = azurerm_key_vault.main.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

  secret_permissions = [
    "Backup", "Delete", "Get", "List", "Purge", "Recover", "Restore", "Set"
  ]

  key_permissions = [
    "Create", "Delete", "Get", "List", "Purge", "Recover", "Restore", "Sign", "UnwrapKey", "Update", "WrapKey", "Verify", "Encrypt", "Decrypt", "Import", "Backup", "Release", "Rotate", "GetRotationPolicy", "SetRotationPolicy"
  ]
}

