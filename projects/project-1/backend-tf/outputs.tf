output "resource_group_name" {
  value = azurerm_resource_group.backend.name
}

output "resource_group_location" {
  value = azurerm_resource_group.backend.location
}

output "storage_account_name" {
  value = azurerm_storage_account.backend.name
}