variable "name" {
  description = "Name of the Azure Bastion host"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "vnet_subnet_id" {
  description = "ID of the AzureBastionSubnet"
  type        = string
}

variable "public_ip_name" {
  description = "Name of the public IP for Bastion"
  type        = string
}

variable "tags" {
  description = "Tags for the Bastion host"
  type        = map(string)
  default     = {}
}
