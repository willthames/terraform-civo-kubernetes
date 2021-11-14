module "namespaces" {
  source = "git::https://github.com/willthames/terraform-kubernetes-module-namespaces?ref=v0.1-0-g537f38c"
}

#module "cilium" {
#  source = "git::https://github.com/willthames/terraform-kubernetes-module-cilium?ref=v1.10.5-0-g1f78efb"
#}

module "external-dns" {
  source = "git::https://github.com/willthames/terraform-module-civo-external-dns?ref=v5.4.15-3-g6b1a461"

  domain     = var.domain
  civo_token = file(var.civo_token)

  depends_on = [module.namespaces]
}

module "cert-manager" {
  source = "git::https://github.com/willthames/terraform-kubernetes-module-civo-cert-manager?ref=v1.6.0-5-ge7fbc85"

  email_address = var.email_address
  civo_token    = file(var.civo_token)

  depends_on = [module.namespaces]
}

#module "ingress-nginx" {
#  source = "git::https://github.com/willthames/terraform-kubernetes-module-ingress-nginx?ref=v1.0.4-0-gd2ce61a"
#}

module "fluent-bit" {
  source = "git::https://github.com/willthames/terraform-kubernetes-module-fluent-bit?ref=v1.8.9-3-g696a8fd"

  depends_on = [module.namespaces]
}

module "prometheus" {
  source = "git::https://github.com/willthames/terraform-kubernetes-module-prometheus?ref=v19.3.0-4-g1a95ad2"

  domain = var.domain

  depends_on = [module.namespaces]
}

module "grafana" {
  source = "git::https://github.com/willthames/terraform-kubernetes-module-grafana?ref=v8.2.3-6-gc109472"

  domain = var.domain

  depends_on = [module.namespaces]
}

module "otel-collector" {
  source = "git::https://github.com/willthames/terraform-kubernetes-module-otel-collector?ref=v0.37.1-2-ge265005"

  depends_on = [module.namespaces]
}

module "docker-debug" {
  source = "git::https://github.com/willthames/terraform-kubernetes-module-docker-debug?ref=v0.11-3-g10917e9"

  domain = var.domain

  depends_on = [module.namespaces]
}
