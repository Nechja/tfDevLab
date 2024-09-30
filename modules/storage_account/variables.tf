variable "name" {
  description = "Name of the Storage Account"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
}

variable "location" {
  description = "Azure location for the Storage Account"
  type        = string
}

variable "account_tier" {
  description = "Storage Account tier"
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "Replication type"
  type        = string
  default     = "LRS"
}

variable "container_names" {
  description = "List of container names"
  type        = list(string)
}

variable "container_access_type" {
  description = "Access level for the containers"
  type        = string
  default     = "private"
}
