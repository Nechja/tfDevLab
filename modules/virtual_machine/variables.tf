variable "vm_name" {
  description = "Base name of the virtual machine(s)"
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

variable "subnet_id" {
  description = "ID of the subnet"
  type        = string
}

variable "vm_size" {
  description = "Size of the VM"
  type        = string
  default     = "Standard_B1s"
}

variable "publisher" {
  description = "Image publisher"
  type        = string
}

variable "offer" {
  description = "Image offer"
  type        = string
}

variable "sku" {
  description = "Image SKU"
  type        = string
}

variable "os_type" {
  description = "Operating system type: 'Windows' or 'Linux'"
  type        = string
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
}

variable "admin_password" {
  description = "Admin password for the VM"
  type        = string
  sensitive   = true
}

variable "instance_count" {
  description = "Number of instances to create"
  type        = number
  default     = 1
}

variable "create_public_ip" {
  description = "Whether to create a public IP for the VM"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags for the virtual machine"
  type        = map(string)
  default     = {}
}

