variable "aws_region" {
  description = "AWS Region to use."
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "VPC cidr block"
}

variable "ecs_cluster_name" {}
variable "internet_cidr_blocks" {}

variable "db_password" {
  type    = string
  default = null
}

variable "smtp_password" {
  type    = string
  default = null
}

variable "jwt_key" {
  type    = string
  default = "abc123"
}

variable "api_url" {
  type    = string
  default = null
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
