

data "terraform_remote_state" "aks" {
  backend = "azurerm"
  config = {
    resource_group_name = "petsi_rg"
    container_name = "state"
    storage_account_name = "petsi"
    key = "provisionning-stack.json"

  }
}

locals {
  kube_config = data.terraform_remote_state.aks.outputs.kube_config.0
  host                   = local.kube_config.host
  username               = local.kube_config.username
  password               = local.kube_config.password
  client_certificate     = base64decode(local.kube_config.client_certificate)
  client_key             = base64decode(local.kube_config.client_key)
  cluster_ca_certificate = base64decode(local.kube_config.cluster_ca_certificate)
}


provider "kubernetes" {
  host                   = local.host
  username               = local.username
  client_certificate     = local.client_certificate
  client_key             = local.client_key
  cluster_ca_certificate = local.cluster_ca_certificate
}


provider "helm" {
  kubernetes {
    host                   = local.host
    username               = local.username
    client_certificate     = local.client_certificate
    client_key             = local.client_key
    cluster_ca_certificate = local.cluster_ca_certificate
  }
}

module "basic_setup" {
  source    = "../setup-stack/modules/basic_setup"
  providers = {
    kubernetes = kubernetes
    helm = helm
  }
  environment = "dev"
}


module "setup_gitops" {
  source    = "../setup-stack/modules/git_ops"
  providers = {
    helm = helm
  }
  namespace = module.basic_setup.argo_namespace_id
  environment = "dev"
}

module "observability_setup" {
  source    = "../setup-stack/modules/observability_setup"
  providers = {
    helm = helm
  }
  namespace = module.basic_setup.observability_namespace_id
  environment = "dev"
}






