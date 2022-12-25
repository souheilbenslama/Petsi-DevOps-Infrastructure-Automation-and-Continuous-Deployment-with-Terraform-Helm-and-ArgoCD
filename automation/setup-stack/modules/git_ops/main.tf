resource "helm_release" Argo {
  name       = "my-ago-release"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "5.16.0"
  namespace = var.namespace
}