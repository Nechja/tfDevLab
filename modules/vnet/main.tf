resource "azurerm_virtual_network" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
}

resource "azurerm_subnet" "this" {
  for_each            = { for subnet in var.subnets : subnet.name => subnet }
  name                = each.value.name
  address_prefixes    = each.value.address_prefixes
  resource_group_name = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name
}

resource "azurerm_subnet_network_security_group_association" "nsg_association" {
  for_each = { for subnet in var.subnets : subnet.name => subnet }
  subnet_id                 = azurerm_subnet.this[each.key].id
  network_security_group_id = lookup(each.value, "network_security_group_id", null)
}
