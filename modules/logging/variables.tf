variable "project_id" {
  description = "Google Cloud project ID"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "dataset_id" {
  description = "BigQuery dataset ID for logs"
  type        = string
}

variable "retention_days" {
  description = "BigQuery table expiration in days"
  type        = number
  default     = 30
}

variable "labels" {
  description = "Labels applied to supported resources"
  type        = map(string)
  default     = {}
}
