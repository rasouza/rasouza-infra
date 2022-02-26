data "digitalocean_kubernetes_versions" "prod" {
  version_prefix = "1.21"
}

resource "digitalocean_kubernetes_cluster" "prod" {
  name = "rasouza-prod"
  version = data.digitalocean_kubernetes_versions.prod.latest_version
  region = "sfo2"
  auto_upgrade = true
  tags = [ "production" ]

  node_pool {
    name = "pool-prod"
    size = "s-1vcpu-2gb"
    node_count = 3
  }
}