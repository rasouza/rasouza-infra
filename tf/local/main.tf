provider "kubernetes" {
  host = "https://localhost:6443"
  config_context_auth_info = "docker-desktop"
  config_context_cluster   = "docker-desktop"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
    config_context = "docker-desktop"
  }
}

provider "vault" {
  # It is strongly recommended to configure this provider through the
  # environment variables described above, so that each user can have
  # separate credentials set in the environment.
  #
  # This will default to using $VAULT_ADDR
  # But can be set explicitly
  address = "http://localhost:8200"
}

resource "helm_release" "kubevela" {
  repository = "https://charts.kubevela.net/core"
  chart = "vela-core"

  name = "kubevela"
  namespace = "vela-system"
  create_namespace = true
}

module "nginx-controller" {
  source  = "terraform-iaac/nginx-controller/helm"
}