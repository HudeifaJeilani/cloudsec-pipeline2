output "app_url" {
  value = "http://${aws_lb.app_alb.dns_name}"
}

output "alb_dns_name" {
  value = aws_lb.app_alb.dns_name
}

output "ecs_cluster_name" {
  value = aws_ecs_cluster.app_cluster.name
}

output "ecs_service_name" {
  value = aws_ecs_service.app_service.name
}

output "target_group_arn" {
  value = aws_lb_target_group.app_tg.arn
}

output "cloudwatch_log_group" {
  value = aws_cloudwatch_log_group.cloudsec_logs.name
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}