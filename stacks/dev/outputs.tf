output "bastion_host_name" {
  description = "Name of the Bastion host"
  value       = module.bastion.bastion_host_name
}

output "bastion_public_ip" {
  description = "Public IP of the Bastion host"
  value       = module.bastion.bastion_public_ip 
}

output "bastion_rdp_commands_windows" {
  description = "Commands to RDP to each Windows VM through Bastion"
  value = [for i in range(module.windows_vms.instance_count) : 
    "az network bastion rdp --name ${module.bastion.bastion_host_name} --resource-group ${module.resource_group.name} --target-resource-id ${module.windows_vms.vm_resource_ids[i]}"
  ]
}

#az network bastion rdp --name bastion-dev --resource-group rg-dev-lab --target-resource-id /subscriptions/5d3830d7-948d-49ea-ac3a-d0cdeae0df21/resourceGroups/rg-dev-lab/providers/Microsoft.Compute/virtualMachines/win-dev-0