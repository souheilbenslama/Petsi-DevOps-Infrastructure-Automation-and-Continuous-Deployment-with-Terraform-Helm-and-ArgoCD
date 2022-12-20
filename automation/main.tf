resource "azurerm_resource_group" "dev" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_kubernetes_cluster" "dev" {
  name                = "example-aks1"
  location            = azurerm_resource_group.dev.location
  resource_group_name = azurerm_resource_group.dev.name
  dns_prefix          = "exampleaks1"
  sku_tier            = "Free"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Development"
  }
}


provider "kubernetes" {
  host                   = azurerm_kubernetes_cluster.dev.kube_config.0.host
  username               = azurerm_kubernetes_cluster.dev.kube_config.0.username
  password               = azurerm_kubernetes_cluster.dev.kube_config.0.password
  client_certificate     = base64decode(azurerm_kubernetes_cluster.dev.kube_config.0.client_certificate)
  client_key             = base64decode(azurerm_kubernetes_cluster.dev.kube_config.0.client_key)
  cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.dev.kube_config.0.cluster_ca_certificate)
}

module "basic_setup" {
  source    = "./modules/basic_setup"
  providers = {
    kubernetes = kubernetes
  }
  environment = "dev"
}
