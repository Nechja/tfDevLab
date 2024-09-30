variable "name" {
  description = "Name of the Bastion host"
  type        = string
}

variable "location" {
  description = "Azure location"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "vnet_name" {
  description = "Name of the virtual network"
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
