resource "helm_release" Argo {
  name       = "my-ago-release"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "5.16.0"
  namespace = var.namespace
}

resource "helm_release" Nginx-ingress {
  name       = "petsi-ingress"
  repository = "https://kubernetes.github.io/ingress-nginx/"
  chart      = "ingress-nginx"
  version    = "4.4.2"
}