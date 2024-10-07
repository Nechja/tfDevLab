module "resource_group" {
  source   = "../../modules/resource_group"
  name     = "rg-dev-lab"
  location = var.location
}

module "nsg_dev_systems" {
  source              = "../../modules/network_security_group"
  name                = "nsg-dev-systems"
  location            = var.location
  resource_group_name = module.resource_group.name
  security_rules = [
    {
      name                       = "Allow-RDP"
      priority                   = 1000
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "3389"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    },
    {
      name                       = "Allow-SSH"
      priority                   = 1010
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    },
    {
      name                       = "Linux-To-Dev"
      priority                   = 1020
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "10.0.2.0/24" 
      destination_address_prefix = "*"
    },
  ]
}

module "nsg_linux_system" {
  source              = "../../modules/network_security_group"
  name                = "nsg-linux-container"
  location            = var.location
  resource_group_name = module.resource_group.name
  security_rules = [
    {
      name                       = "Dev-To-Linux"
      priority                   = 1000
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "10.0.1.0/24" 
      destination_address_prefix = "*"
    },
  ]
}

module "vnet" {
  source              = "../../modules/vnet"
  name                = "vnet-dev-lab"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = module.resource_group.name

  subnets = [
    {
      name                      = "subnet-dev-systems"
      address_prefixes          = ["10.0.1.0/24"]
      network_security_group_id = module.nsg_dev_systems.id
    },
    {
      name                      = "subnet-linux-system"
      address_prefixes          = ["10.0.2.0/24"]
      network_security_group_id = module.nsg_linux_system.id
    }
  ]
}

module "windows_vms" {
  source              = "../../modules/virtual_machine"
  vm_name             = "win-dev"
  location            = var.location
  resource_group_name = module.resource_group.name
  subnet_id           = module.vnet.subnet_ids["subnet-dev-systems"]
  vm_size             = "Standard_D2s_v3"
  publisher           = "MicrosoftWindowsDesktop"
  offer               = "Windows-11"
  sku                 = "win11-21h2-pro"
  os_type             = "Windows"
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  instance_count      = 2
  create_public_ip    = true
  tags                = { environment = "dev" }
}

module "linux_vm" {
  source              = "../../modules/virtual_machine"
  vm_name             = "linux-dev"
  location            = var.location
  resource_group_name = module.resource_group.name
  subnet_id           = module.vnet.subnet_ids["subnet-linux-system"]
  vm_size             = "Standard_B2s"
  publisher           = "Canonical"
  offer               = "0001-com-ubuntu-server-focal"
  sku                 = "20_04-lts-gen2"
  os_type             = "Linux"
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  instance_count      = 1
  create_public_ip    = true
  tags                = { environment = "dev" }
}