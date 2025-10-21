resource "random_string" "keyvault_monitor" {
  length  = 8
  upper   = false
  lower   = true
  special = false
}

locals {
  suffix = "zhtijykl"
}

data "azurerm_storage_account" "monitor" {
  name                = "stp1${local.suffix}"
  resource_group_name = "rg-p1-${local.suffix}"
}

data "azurerm_log_analytics_workspace" "monitor" {
  name                = "log-p1-${local.suffix}"
  resource_group_name = "rg-p1-${local.suffix}"
}

resource "azurerm_monitor_diagnostic_setting" "activity_logs" {
  name                       = "diag-${random_string.keyvault_monitor.result}"
  target_resource_id         = azurerm_key_vault.main.id
  storage_account_id         = data.azurerm_storage_account.monitor.id
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.monitor.id

  enabled_log {
    category_group = "audit"
  }

  enabled_log {
    category_group = "allLogs"
  }

  enabled_metric {
    category = "AllMetrics"
  }
}