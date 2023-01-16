resource "helm_release" Argo {
  name       = "my-ago-release"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "5.16.0"
  namespace = var.namespace
}

#resource "helm_release" ArgoApp {
#  name       = "my-argo-petsi-app-release"
#  repository = "https://github.com/souheilbenslama/souheilbenslama.github.io/charts"
#  chart      = "argo-petsi-app"
#  namespace = var.namespace
#}
