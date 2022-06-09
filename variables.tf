variable "aws_region" {
  description = "AWS region where Sysdig components will be deployed"
  default     = "us-east-1"
  type        = string
}

variable "aws_ecs_cluster_id" {
  description = "AWS ECS cluster where Sysdig components will be deployed"
  type        = string
}

variable "sysdig_access_key" {
  description = "Sysdig agent access key"
  type        = string
}

variable "sysdig_collector" {
  description = "Sysdig collector endpoint"
  type        = string
}

variable "sysdig_endpoint" {
  description = "Sysdig collector endpoint"
  type        = string
}

variable "sysdig_agent_mode" {
  description = "Sysdig collector endpoint"
  default     = "monitor"
  type        = string
}

variable "tags" {
  description = "AWS tags"
  default     = "sysdig-agent"
  type        = string
}
