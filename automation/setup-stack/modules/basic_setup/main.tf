
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

 # resource "helm_release" Nginx-ingress {
 # name       = "petsi-ingress"
 # repository = "https://kubernetes.github.io/ingress-nginx/"
 # chart      = "ingress-nginx"
 # version    = "4.4.2"
 # }

resource "helm_release" Prometheus {
  name       = "prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus"
  version    = "19.3.1"
  values = [
    <<-EOF
      scrape_configs:
      - job_name: prometheus
        static_configs:
          - targets:
            - localhost:9090
      - job_name: prometheus
        static_configs:
          - targets:
            - localhost:9090
    EOF
  ]
}