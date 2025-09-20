resource "azurerm_resource_group" "backend" {
  name       = "${var.resource_group_name}${var.suffix}"
  location   = var.location
  managed_by = "terraform"
  tags       = var.resource_group_tags
}