
resource "kubernetes_namespace" "argocd" {
  metadata {
    labels = {
      environment = var.environment
    }
    name = "gitops"
  }
}


resource "kubernetes_namespace" "istio-system" {
  metadata {
    labels = {
      environment = var.environment
    }
    name = "istio-system"
  }
}

resource "kubernetes_namespace" "observability" {
  metadata {
    labels = {
      environment = var.environment
    }
    name = "observability"
  }
}

resource "helm_release" Nginx-ingress {
  name       = "petsi-ingress"
  repository = "https://kubernetes.github.io/ingress-nginx/"
  chart      = "ingress-nginx"
  version    = "4.4.2"
  }

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


resource "helm_release" "istio" {
  name       = "istio"
  repository = "https://istio-release.storage.googleapis.com/charts"
  chart      = "base"
}

resource "helm_release" "kiali" {

  name       = "kiali"
  repository = "https://kiali.org/helm-charts"
  chart      = "kiali-operator"
}