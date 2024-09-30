variable "name" {
  description = "Name of the Virtual Network"
  type        = string
}

variable "address_space" {
  description = "Address space for the VNet"
  type        = list(string)
}

variable "location" {
  description = "Azure location for the VNet"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
}

variable "subnets" {
  description = "List of subnets"
  type = list(object({
    name                      = string
    address_prefixes          = list(string)
    network_security_group_id = optional(string)
  }))
}

