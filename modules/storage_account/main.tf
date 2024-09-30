resource "azurerm_storage_account" "this" {
  name                     = var.name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_storage_container" "this" {
  for_each             = toset(var.container_names)
  name                 = each.value
  storage_account_name = azurerm_storage_account.this.name
  container_access_type = var.container_access_type
}