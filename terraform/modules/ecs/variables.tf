variable "cluster_name" {
  description = "The name to be given to the ASG"
  type        = string
}

variable "ecs_service_name" {}

variable "bmore-responsive_desired_count" {
  description = "The number of tasks to run in the service"
  type        = string
}

variable "bmore-responsive_target_group_arn" {
  description = "The ARN of the Target Group for Load Balancing"
  type        = string
}

variable "bmore-responsive_container_port" {
  description = "The port on the container to associate with the Load Balancer"
  type        = string
}

variable "bmore-responsive_container_definitions" {
  description = "The Rendered JSON of a container definition array. See example-container.json for a sample of valid JSON input."
  type        = string
}

variable "output_bucket_arn" {
  description = "ARN of the S3 bucket that contains the output files"
  type        = string
}

variable "seed_data_bucket_arn" {
  description = "arn of the seed data bucket"
  type        = string
}

variable "aws_region" {}

variable "fargate_cpu" {
  default     = "1024"
  description = "fargate instance CPU units to provision, my requirement vcpu = 1 cpu * 1024"
}

variable "fargate_memory" {
  default     = "2048"
  description = "Fargate instance memory to provision (in MiB) not MB"
}

#temporary use until DNS switchover
variable "public_subnet_ids" {}
variable "vpc_id" {}
variable "vpc_cidr" {}
