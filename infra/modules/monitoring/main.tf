# Create Namespace for Monitoring
resource "kubernetes_namespace" "monitoring" {
  metadata {
    name = "monitoring"
  }
}

resource "helm_release" "prometheus" {
  name       = "prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus"
  namespace  = "monitoring"
  
  set {
    name  = "podSecurityPolicy.enabled"
    value = true
  }

  set {
    name  = "server.persistentVolume.enabled"
    value = false
  }

  set {
    name  = "server.service.type"
    value = "LoadBalancer"
   }
   set {
    name  = "datasourcesConfigMaps"
    value = "grafana-datasources"  # Mounts our ConfigMap
  }
}

resource "helm_release" "grafana" {
  name       = "grafana"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "grafana"
  namespace  = "monitoring"

  set {
    name  = "service.type"
    value = "LoadBalancer"
  }

  set {
    name  = "adminPassword"
    value = "admin"
  }
}
