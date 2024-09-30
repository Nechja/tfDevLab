output "vnet_id" {
  description = "The ID of the VNet"
  value       = azurerm_virtual_network.this.id
}

output "subnet_ids" {
  description = "Map of subnet names to their IDs"
  value       = { for subnet in azurerm_subnet.this : subnet.name => subnet.id }
}