terraform {
  required_providers {
    kustomization = {
      source  = "kbst/kustomization"
      version = "0.7.0"
    }
  }
}

provider "kustomization" {
  kubeconfig_path = var.kubeconfig
}

provider "aws" {
  region = var.default_region
}
