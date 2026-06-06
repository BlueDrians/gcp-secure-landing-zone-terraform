variable "billing_account_id" {
  description = "Billing account ID"
  type        = string
}

variable "project_id" {
  description = "Google Cloud project ID"
  type        = string
}

variable "budget_amount" {
  description = "Budget amount in USD"
  type        = number
  default     = 50
}

variable "notification_email_address" {
  description = "Email address documented as the budget notification owner."
  type        = string
}
