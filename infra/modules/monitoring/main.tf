provider "kubernetes" {
  host                   = var.eks_cluster_endpoint
  cluster_ca_certificate = base64decode(var.eks_cluster_certificate_authority)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args        = ["eks", "get-token", "--cluster-name", var.eks_cluster_id]
  }
}

provider "helm" {
  kubernetes {
    host                   = var.eks_cluster_endpoint
    cluster_ca_certificate = base64decode(var.eks_cluster_certificate_authority)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      command     = "aws"
      args        = ["eks", "get-token", "--cluster-name", var.eks_cluster_id]
    }
  }
}

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
  timeout = 400
  
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

  set {
    name  = "datasources.\"datasources.yaml\".apiVersion"
    value = "1"
  }

  set {
    name  = "datasources.\"datasources.yaml\".datasources[0].name"
    value = "Prometheus"
  }

  set {
    name  = "datasources.\"datasources.yaml\".datasources[0].type"
    value = "prometheus"
  }

  set {
    name  = "datasources.\"datasources.yaml\".datasources[0].url"
    value = "http://prometheus-server.monitoring.svc.cluster.local"  # URL inside Kubernetes cluster
  }

  set {
    name  = "datasources.\"datasources.yaml\".datasources[0].access"
    value = "proxy"
  }

  set {
    name  = "datasources.\"datasources.yaml\".datasources[0].isDefault"
    value = "true"
  }
}
