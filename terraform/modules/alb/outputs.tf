output "lb-id" {
  description = "ID of the lb"
  value       = aws_lb.ecs_cluster_alb.id
}

output "lb-dns" {
  description = "DNS name for the lb"
  value       = aws_lb.ecs_cluster_alb.dns_name
}

output "lb-arn" {
  description = "ARN of the lb"
  value       = aws_lb.ecs_cluster_alb.arn
}

output "tg-cfb-arn" {
  description = "ARN of the Target Group"
  value       = aws_lb_target_group.ecs_default_target_group.arn
}

output "zone_id" {
  value = aws_lb.ecs_cluster_alb.zone_id
}

