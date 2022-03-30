# Create a resource group
resource "azurerm_resource_group" "example" {
  name     = var.resourcename
  location = var.location
}

resource "azurerm_kubernetes_cluster" "default" {
  name                = var.clustername
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  dns_prefix          = var.clustername

  default_node_pool {
    name            = "default"
    node_count      = var.nodecount
    vm_size         = var.vmsize 
    os_disk_size_gb = var.osdisk
  }

  identity {
    type = var.identitytype
  }

#   role_based_access_control {
#     enabled = var.rbac
#   }

  tags = {
    environment = "Demo"
  }
}
