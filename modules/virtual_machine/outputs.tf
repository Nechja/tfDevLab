output "vm_ids" {
  description = "The IDs of the virtual machines"
  value       = [for vm in azurerm_virtual_machine.this : vm.id]
}

output "public_ip_addresses" {
  description = "Public IP addresses of the VMs"
  value       = [for ip in azurerm_public_ip.this : ip.ip_address]
}
