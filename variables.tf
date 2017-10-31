variable "internal_lb" {
  description = "Bool check to determine if lb should face internally"
  default     = false
}

variable "external_lb" {
  description = "Bool check to determine if lb should face externally"
  default     = false
}

variable "name" {
  description = "Name of the load balancer"
}

variable "vpc_id" {
  description = "VPC to place the load balancer in"
}

variable "private_subnets" {
  type        = "list"
  description = "List of private subnets"
  default     = []
}

variable "public_subnets" {
  type        = "list"
  description = "List of public subnets for externally facing alb"
  default     = []
}
