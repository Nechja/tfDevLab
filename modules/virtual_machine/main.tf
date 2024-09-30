resource "azurerm_public_ip" "this" {
  count               = var.instance_count
  name                = "${var.vm_name}-${count.index}-pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
  sku                 = "Basic"
}


resource "azurerm_network_interface" "this" {
  count               = var.instance_count
  name                = "${var.vm_name}-${count.index}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.create_public_ip ? azurerm_public_ip.this[count.index].id : null
  }
}

resource "azurerm_virtual_machine" "this" {
  count                 = var.instance_count
  name                  = "${var.vm_name}-${count.index}"
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.this[count.index].id]
  vm_size               = var.vm_size

  storage_os_disk {
    name              = "${var.vm_name}-${count.index}-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = "latest"
  }

  os_profile {
    computer_name  = "${var.vm_name}-${count.index}"
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  dynamic "os_profile_linux_config" {
    for_each = var.os_type == "Linux" ? [1] : []
    content {
      disable_password_authentication = false
    }
  }

  dynamic "os_profile_windows_config" {
    for_each = var.os_type == "Windows" ? [1] : []
    content {
      provision_vm_agent        = true
      enable_automatic_upgrades = true
    }
  }

  tags = var.tags
}
