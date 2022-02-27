terraform {
  required_providers {
    scaleway = {
      source = "scaleway/scaleway"
    }

    helm = {
      source = "hashicorp/helm"
    }
  }
  required_version = ">= 0.13"
}

provider "scaleway" {
  zone = "fr-par-1"
  region = "fr-par"

  project_id = var.project_id
  access_key = var.access_key
  secret_key = var.secret_key
}

provider "helm" {
  kubernetes {
    host = null_resource.kubeconfig.triggers.host
    token = null_resource.kubeconfig.triggers.token
    cluster_ca_certificate = base64decode(
    null_resource.kubeconfig.triggers.cluster_ca_certificate
    )
  }
}

variable "project_id" {
  type        = string
  description = "Your project ID."
}

variable "access_key" {
  type        = string
  description = "Scaleway acccess key"
}

variable "secret_key" {
  type        = string
  description = "Scaleway Secret Key"
}