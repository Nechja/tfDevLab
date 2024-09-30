variable "name" {
  description = "Name of the container group"
  type        = string
}

variable "location" {
  description = "Azure location"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "os_type" {
  description = "Operating system type for the container (Linux or Windows)"
  type        = string
}

variable "container_name" {
  description = "Name of the container"
  type        = string
}

variable "image" {
  description = "Container image to deploy"
  type        = string
}

variable "cpu" {
  description = "CPU cores for the container"
  type        = number
  default     = 1
}

variable "memory" {
  description = "Memory in GB for the container"
  type        = number
  default     = 1.5
}

variable "port" {
  description = "Port for the container"
  type        = number
}

variable "protocol" {
  description = "Protocol for the container (TCP/UDP)"
  type        = string
  default     = "TCP"
}

variable "docker_username" {
  description = "Docker Hub username for pulling the container image"
  type        = string
}

variable "docker_password" {
  description = "Docker Hub password or token for pulling the container image"
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "Tags for the container group"
  type        = map(string)
  default     = {}
}
