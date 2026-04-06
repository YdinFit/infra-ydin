variable "cloudflare_account_id" {
  description = "Cloudflare account ID"
  type        = string
  sensitive   = true
}

variable "environment" {
  description = "Environment name (e.g. prod, staging)"
  type        = string
  default     = "prod"
}

variable "project" {
  description = "Project name used in resource naming"
  type        = string
  default     = "ydin"
}

variable "storage_container_name" {
  description = "Name of the R2 bucket segment holding the data"
  type        = string
  default     = "open-food-facts"
}
