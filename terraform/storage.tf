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
