output "argo_namespace_id" {
  description = "namespace id"
  value = kubernetes_namespace.argocd.id

}

output "petsi_back_namespace_id" {
  description = "namespace id"
  value = kubernetes_namespace.petsi-back.id

}