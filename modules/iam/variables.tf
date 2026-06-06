variable "project_id" {
  description = "Google Cloud project ID"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "admin_group_email" {
  description = "Google Group email for administrators"
  type        = string
}

variable "labels" {
  description = "Labels applied to supported resources"
  type        = map(string)
  default     = {}
}
