variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "project_name" {
  type    = string
  default = "cloudsec-app"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnet1_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "public_subnet2_cidr" {
  type    = string
  default = "10.0.2.0/24"
}

variable "private_subnet1_cidr" {
  type    = string
  default = "10.0.11.0/24"
}

variable "private_subnet2_cidr" {
  type    = string
  default = "10.0.12.0/24"
}

variable "availability_zone_1" {
  type    = string
  default = "us-east-1a"
}

variable "availability_zone_2" {
  type    = string
  default = "us-east-1b"
}

variable "container_port" {
  type    = number
  default = 80
}

variable "container_image" {
  type    = string
  default = "083141433357.dkr.ecr.us-east-1.amazonaws.com/cloudsec-app:v9-amd64"
}

variable "task_cpu" {
  type    = number
  default = 256
}

variable "task_memory" {
  type    = number
  default = 512
}

variable "desired_count" {
  type    = number
  default = 2
}

variable "log_retention_days" {
  type    = number
  default = 7
}