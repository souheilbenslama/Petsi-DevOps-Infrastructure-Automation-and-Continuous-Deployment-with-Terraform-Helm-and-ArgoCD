output "argo_namespace_id" {
  description = "namespace id"
  value = kubernetes_namespace.argocd.id

}

output "observability_namespace_id" {
  description = "namespace id"
  value = kubernetes_namespace.observability.id

}