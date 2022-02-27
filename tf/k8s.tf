resource "scaleway_k8s_cluster" "prod" {
  name    = "k8s-production"
  version = "1.23"
  cni     = "cilium"
  auto_upgrade {
    enable = true
    maintenance_window_start_hour = 0
    maintenance_window_day = "any"
  }
}

resource "scaleway_k8s_pool" "default" {
  cluster_id = scaleway_k8s_cluster.prod.id
  name       = "default"
  node_type  = "DEV1-M"
  size       = 1
}

resource "null_resource" "kubeconfig" {
  depends_on = [scaleway_k8s_pool.default] # at least one pool here
  triggers = {
    host                   = scaleway_k8s_cluster.prod.kubeconfig[0].host
    token                  = scaleway_k8s_cluster.prod.kubeconfig[0].token
    cluster_ca_certificate = scaleway_k8s_cluster.prod.kubeconfig[0].cluster_ca_certificate
  }
}

resource "helm_release" "kubevela" {
  repository = "https://charts.kubevela.net/core"
  chart = "vela-core"

  name = "kubevela"
  namespace = "vela-system"
  create_namespace = true
}