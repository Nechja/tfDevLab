output "storage_account_id" {
  description = "The ID of the Storage Account"
  value       = azurerm_storage_account.this.id
}

output "container_ids" {
  description = "Map of container names to their IDs"
  value       = { for container in azurerm_storage_container.this : container.name => container.id }
}
