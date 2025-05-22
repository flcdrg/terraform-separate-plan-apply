resource "azurerm_storage_account" "storage" {
  name                     = "sttfplanapplyaue"
  resource_group_name      = data.azurerm_resource_group.group.name
  location                 = data.azurerm_resource_group.group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  access_tier              = "Cool"

  network_rules {
    default_action = "Deny"
    ip_rules       = []
  }

  tags = {
    "date" = var.date
  }
}

output "storage_account_name" {
  value = azurerm_storage_account.storage.name
}

output "storage_account_key" {
  value       = azurerm_storage_account.storage.primary_access_key
  sensitive   = true
  description = "Primary access key for the storage account"
}
