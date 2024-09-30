variable "name" {
  description = "Name of the Azure Firewall"
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
  description = "ID of the AzureFirewallSubnet"
  type        = string
}

variable "public_ip_name" {
  description = "Name of the public IP for Firewall"
  type        = string
}

variable "tags" {
  description = "Tags for the Azure Firewall"
  type        = map(string)
  default     = {}
}
