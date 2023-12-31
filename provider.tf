terraform {
  required_providers {
    kind = {
      source  = "tehcyx/kind"
      version = "0.0.15"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
  }
}

provider "kind" {}

provider "kubectl" {
  #   config_path = "~/.kube/config"
  host = kind_cluster.default.endpoint
  cluster_ca_certificate = kind_cluster.default.cluster_ca_certificate
  client_certificate = kind_cluster.default.client_certificate
  client_key = kind_cluster.default.client_key
}

provider "kubernetes" {
  #   config_path    = "~/.kube/config"
  host = kind_cluster.default.endpoint
  cluster_ca_certificate = kind_cluster.default.cluster_ca_certificate
  client_certificate = kind_cluster.default.client_certificate
  client_key = kind_cluster.default.client_key
}

provider "helm" {
  kubernetes {
    host = kind_cluster.default.endpoint
    cluster_ca_certificate = kind_cluster.default.cluster_ca_certificate
    client_certificate = kind_cluster.default.client_certificate
    client_key = kind_cluster.default.client_key
  }
}
