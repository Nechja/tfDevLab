resource "azurerm_container_group" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = var.os_type

  container {
    name   = var.container_name
    image  = var.image
    cpu    = var.cpu
    memory = var.memory

    ports {
      port     = var.port
      protocol = var.protocol
    }
  }

  tags = var.tags

  image_registry_credential {
    server   = "index.docker.io"
    username = var.docker_username   
    password = var.docker_password 
  }
}
