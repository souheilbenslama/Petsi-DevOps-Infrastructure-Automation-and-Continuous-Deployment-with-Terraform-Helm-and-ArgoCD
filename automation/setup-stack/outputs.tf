output "kube_config" {
  value = data.terraform_remote_state.aks.outputs.kube_config
  sensitive = true
}

