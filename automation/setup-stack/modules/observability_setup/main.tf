
resource "helm_release" datadog {
  name       = "datadog"
  repository = "https://helm.datadoghq.com"
  chart      = "datadog"
  version    = "3.7.2"
  #namespace = var.namespace
  }

resource "helm_release" "graphana" {
  name       = "graphana"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "grafana"
  #namespace  = var.namespace
}

