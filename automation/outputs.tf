output "kube_config" {
  value = azurerm_kubernetes_cluster.dev.kube_config_raw
  sensitive = true
}

output "namespace_id" {
  value = module.basic_setup.namespace_id
  description = "Namespace ID"
}