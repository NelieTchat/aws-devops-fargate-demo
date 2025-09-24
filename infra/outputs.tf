output "alb_dns" { value = aws_lb.this.dns_name }
output "service_name" { value = aws_ecs_service.app.name }
output "cluster_name" { value = aws_ecs_cluster.this.name }
