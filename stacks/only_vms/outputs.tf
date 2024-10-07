output "windows_vms_public_ips" {
  description = "Public IP addresses of the Windows VMs"
  value       = module.windows_vms.public_ip_addresses
}

output "linux_vm_public_ip" {
  description = "Public IP address of the Linux VM"
  value       = module.linux_vm.public_ip_addresses
}
