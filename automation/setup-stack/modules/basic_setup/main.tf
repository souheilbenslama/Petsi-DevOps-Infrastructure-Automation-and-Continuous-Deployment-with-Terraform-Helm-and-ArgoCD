resource "kubernetes_namespace" "dev" {
  metadata {
    labels = {
      environment = var.environment
    }
    name = "petsi-back"
  }
}


resource "kubernetes_namespace" "argocd" {
  metadata {
    labels = {
      environment = var.environment
    }
    name = "gitops"
  }
}