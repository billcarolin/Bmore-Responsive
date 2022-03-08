terraform {
  required_version = ">= 0.12"
}

# TODO: Add Documentation about adding HTTPS
# TODO: Make sure APIs have health checks that can be used
# Create ALB
resource "aws_lb" "ecs_cluster_alb" {
  name               = "bmore-responsive-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.lb_sg]
  subnets = var.vpc_subnets

  enable_cross_zone_load_balancing = true

  enable_deletion_protection = false

  tags = merge(
    {
      "Name" = "${var.ecs_cluster_name}-alb"
    },
    var.mytags,
  )
}

# Create ALB listener
# TODO: Add ALB Routing rules
resource "aws_lb_listener" "api-listener" {
  load_balancer_arn = aws_lb.ecs_cluster_alb.arn
  port              = "80"
  protocol          = "HTTP"
  #TODO -- change to SSL and add certificate and policy
  #ssl_policy        = "ELBSecurityPolicy-2016-08"  Why is this old policy?
  #certificate_arn   = var.certificate_arn
  #ssl_policy        = "ELBSecurityPolicy-TLS-1-2-2017-01"

  default_action {
    target_group_arn = aws_lb_target_group.ecs_default_target_group.arn
    type             = "forward"
  }
}

#TODO -- May need new listener on sub-domain for api, to split front-end/api traffic
//resource "aws_alb_listener_rule" "ecs_alb_listener_rule" {
//  listener_arn = aws_lb_listener.api-listener.arn
//
//  action {
//    type             = "forward"
//    target_group_arn = aws_lb_target_group.ecs_default_target_group.arn
//  }
//
//  condition {
//    host_header {
//      #values = ["${lower(var.ecs_service_name)}.${data.terraform_remote_state.platform.outputs.ecs_domain_name}"]
//      #values = ["${lower(var.ecs_service_name)}"]
//    }
//  }
//
//}

# Create ALB target group for both containers
resource "aws_lb_target_group" "ecs_default_target_group" {
  name = "${var.ecs_cluster_name}-TG"
  port        = var.cfb_app_port
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  depends_on  = [aws_lb.ecs_cluster_alb]
  lifecycle {
    create_before_destroy = true
  }

  health_check {
    path = "/health"
  }

  tags = {
    Name = "${var.ecs_cluster_name}-TG"
  }
}


