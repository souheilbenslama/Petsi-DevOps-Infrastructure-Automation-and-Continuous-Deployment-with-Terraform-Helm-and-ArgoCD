
resource "kubernetes_namespace" "argocd" {
  metadata {
    labels = {
      environment = var.environment
    }
    name = "gitops"
  }
}

resource "kubernetes_namespace" "petsi-back" {
  metadata {
    labels = {
      environment = var.environment
    }
    name = "petsi-back"
  }
}