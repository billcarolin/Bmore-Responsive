terraform {
  required_version = ">= 0.12"
}

# Create security group

resource "aws_security_group" "sg-alb-ecs" {
  name        = "${var.ecs_cluster_name}-alb-access"
  description = "Security Group for ALB to traffic for ECS cluster"
  vpc_id      = "${var.vpc_id}"

  # Merge tags from environment tfvars and create name tag
  tags = merge(tomap({"Name" = "bmore-responsive-alb-access"}), var.mytags)

  ingress {
    # TLS (change to whatever ports you need)
    #TODO -- change to 443 when ready
    from_port = 80
    to_port   = 80
    protocol  = "tcp"

    # We open to 0.0.0.0/0 here to support the testing activities.
    # In a production environment, these connections would be limited to
    # approved internal IPs. (10.x.x.x/x block(s))
    #TODO -- cidr_blocks = [var.internet_cidr_blocks]
    #currently both public and private ips inside this VPC
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.internet_cidr_blocks]
  }
}


resource "aws_security_group" "sg-ecs" {
  name   = "${var.ecs_cluster_name}-ecs-host-access"
  vpc_id = "${var.vpc_id}"

  # Merge tags from environment tfvars and create name tag
  tags = merge(tomap({"Name" = "bmore-responsive-ecs-host-access"}), var.mytags)

  ingress {
    from_port       = 32768
    to_port         = 61000
    protocol        = "tcp"
    security_groups = ["${aws_security_group.sg-alb-ecs.id}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "sg_postgresql" {
  name   = "${var.ecs_cluster_name}-db-access"
  vpc_id = var.vpc_id

  # Merge tags from environment tfvars and create name tag
  tags = merge(tomap({"Name" = "bmore-responsive-db-access"}), var.mytags)

  ingress {
    # TLS (change to whatever ports you need)
    from_port = 5432
    to_port   = 5432
    protocol  = "tcp"

    # We open to 0.0.0.0/0 here to support the testing activities.
    # In a production environment, these connections would be limited to
    # approved internal IPs. (10.x.x.x/x block(s))
    cidr_blocks = var.db_ingress_cidrs
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# TODO: Add SG Rules for ECS ASG and Load Balancer.
