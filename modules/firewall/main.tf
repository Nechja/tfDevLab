resource "azurerm_public_ip" "this" {
  name                = var.public_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_firewall" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku {
    tier = "Standard"
  }

  ip_configuration {
    name                 = "firewall-configuration"
    subnet_id            = var.vnet_subnet_id
    public_ip_address_id = azurerm_public_ip.this.id
  }

  tags = var.tags
}
