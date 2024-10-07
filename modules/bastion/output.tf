output "bastion_host_id" {
  description = "ID of the Bastion host"
  value       = azurerm_bastion_host.this.id
}

output "bastion_host_name" {
  description = "Name of the Bastion host"
  value       = azurerm_bastion_host.this.name
}

output "bastion_public_ip" {
  description = "Public IP address of the Bastion host"
  value       = azurerm_public_ip.this.ip_address
}


