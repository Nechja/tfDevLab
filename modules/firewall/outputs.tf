output "firewall_id" {
  description = "ID of the Azure Firewall"
  value       = azurerm_firewall.this.id
}

output "firewall_private_ip" {
  description = "Private IP address of the Azure Firewall"
  value       = azurerm_firewall.this.ip_configuration[0].private_ip_address
}
