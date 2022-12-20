resource "kubernetes_namespace" "dev" {
  metadata {
    labels = {
      environment = var.environment
    }
    name = "petsi-back"
  }
}