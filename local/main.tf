provider "kubernetes" {
  config_path = "~/.kube/config"

  config_context   = "docker-desktop"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
    config_context = "docker-desktop"
  }
}

resource "helm_release" "kubevela" {
  repository = "https://charts.kubevela.net/core"
  chart = "vela-core"

  name = "kubevela"
  namespace = "vela-system"
  create_namespace = true

  provisioner "local-exec" {
    command = "vela addon enable fluxcd"
  }

  provisioner "local-exec" {
    when = destroy
    command = "vela addon disable fluxcd"
  }
}

resource "helm_release" "consul" {
  repository = "https://helm.releases.hashicorp.com"
  chart = "consul"

  name = "consul"
  namespace = "hashicorp"
  create_namespace = true

  set {
    name  = "client.enabled"
    value = "true"
  }

  set {
    name  = "server.affinity"
    value = ""
  }

  set {
    name  = "server.replicas"
    value = "1"
  }

  set {
    name  = "server.bootstrapExpect"
    value = "1"
  }

  set {
    name  = "server.disruptionBudget.maxUnavailable"
    value = "0"
  }
}

resource "helm_release" "vault" {
  repository = "https://helm.releases.hashicorp.com"
  chart = "vault"

  name = "vault"
  namespace = "hashicorp"
  create_namespace = true
  
  set {
    name  = "server.ha.enabled"
    value = "true"
  }

  set {
    name  = "server.ha.replicas"
    value = "1"
  }

  set {
    name  = "server.affinity"
    value = ""
  }
}

resource "helm_release" "external-secrets" {
  repository = "https://external-secrets.github.io/kubernetes-external-secrets/"
  chart = "kubernetes-external-secrets"

  name = "external-secrets"
  namespace = "external-secrets"
  create_namespace = true
}

module "nginx-controller" {
  source  = "terraform-iaac/nginx-controller/helm"
}