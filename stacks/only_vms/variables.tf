variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "West US"
}

variable "admin_username" {
  description = "Admin username for VMs"
  type        = string
  default     = "azureuser"
}

variable "admin_password" {
  description = "Admin password for VMs"
  type        = string
  sensitive   = true
}

variable "docker_username" {
  description = "Docker Hub username"
  type        = string
}

variable "docker_password" {
  description = "Docker Hub password or token"
  type        = string
  sensitive   = true
}

