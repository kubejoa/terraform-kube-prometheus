resource "kind_cluster" "default" {
  name           = "cluster-1"
  wait_for_ready = true

  kind_config {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"

    node {
      role  = "control-plane"
      image = "kindest/node:v1.27.3"
    }

    node {
      role  = "worker"
      image = "kindest/node:v1.27.3"
    }
  }
}

resource "kubernetes_namespace" "example" {
  metadata {
    name = "monitoring"
  }
}

resource "helm_release" "kube-prometheus" {
  name       = "kube-prometheus-stackr"
  namespace  = "monitoring"
  version    = "36.2.0"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
}