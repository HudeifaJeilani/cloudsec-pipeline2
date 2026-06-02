output "app_url" {
  value = "https://${var.subdomain_name}.${var.domain_name}"
}

output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "ecr_repository_url" {
  value = module.ecr.repository_url
}

output "ecs_cluster_name" {
  value = module.ecs.cluster_name
}

output "ecs_service_name" {
  value = module.ecs.service_name
}

output "vpc_id" {
  value = module.vpc.vpc_id
}