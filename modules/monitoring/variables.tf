variable "project_id" {
  description = "Google Cloud project ID"
  type        = string
}

variable "notification_email_address" {
  description = "Email address for notification channel"
  type        = string
}

variable "labels" {
  description = "Labels applied to supported resources"
  type        = map(string)
  default     = {}
}
