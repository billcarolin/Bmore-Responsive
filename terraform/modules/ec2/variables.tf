variable "subnet_ids" {
  description = "The VPC Subnet IDs available to launch in"
  type        = list(string)
}

variable "app_name" {
  description = "Application name"
}

variable "tags" {
  description = "Tags to include on the resources"
  type        = map(string)
}

variable "ec2_ami" {
  description = "ec2 AMI ID"
}
variable "user_data" {
  description = "The user data to provide when launching the instance."
  type        = string
}
variable "ec2_instance_type" {
  description = "ec2 instance type"
}

variable "ec2_instance_count" {
  description = "Number of ec2 instances"
}

variable "vpc_sg" {
  description = "List of VPC security group IDs"
  type        = list(string)
}

variable "ecs_role" {
  description = "The ARN of the role attached to ECS Cluster instances"
  type        = string
}
