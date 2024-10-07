output "vm_ids" {
  description = "The IDs of the virtual machines"
  value       = [for vm in azurerm_virtual_machine.this : vm.id]
}

output "public_ip_addresses" {
  description = "Public IP addresses of the VMs"
  value       = [for ip in azurerm_public_ip.this : ip.ip_address]
}

output "vm_resource_ids" {
  description = "Resource IDs of the VMs"
  value       = [for i in azurerm_virtual_machine.this : i.id] 
}

output "vm_names" {
  description = "Names of the VMs"
  value       = [for i in azurerm_virtual_machine.this : i.name] 
}

output "instance_count" {
  description = "Number of VM instances created"
  value       = var.instance_count
}

