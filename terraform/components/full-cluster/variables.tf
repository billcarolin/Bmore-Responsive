variable "aws_region" {
  description = "AWS Region to use."
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "VPC cidr block"
}
variable public_subnet_cidrs {}
variable private_subnet_cidrs {}

variable "ecs_cluster_name" {}
variable "ecs_service_name" {}
variable "internet_cidr_blocks" {}
variable "fargate_cpu" {
  default     = "1024"
  description = "fargate instance CPU units to provision, my requirement vcpu = 1 cpu * 1024"
}

variable "fargate_memory" {
  default     = "2048"
  description = "Fargate instance memory to provision (in MiB) not MB"
}
variable "docker_container_port" {}

variable "db_password" {
  type    = string
}

variable "smtp_password" {
  type    = string
}

variable "jwt_key" {
  type    = string
}

variable "api_url" {
  type    = string
}

variable "public_hosted_zone_name" {}

variable "waf_whitelist_cidrs" {
  type = list(string)
  default = [
    "0.0.0.0/0"
  ]
}

variable "create_waf" {
  type    = bool
  default = false
}

variable "zone_id" {}
