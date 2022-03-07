variable "vpc_id" {
  description = "VPC ID"
}

variable "mytags" {
  description = "Tags to include on the resources"
  type        = map(string)
  default     = {}
}

variable "db_ingress_cidrs" {
  type = list(string)
}

variable "ecs_cluster_name" {}
variable "internet_cidr_blocks" {}
