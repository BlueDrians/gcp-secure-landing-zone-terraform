variable "project_id" {
  description = "Existing Google Cloud project ID"
  type        = string
}

variable "region" {
  description = "Default Google Cloud region"
  type        = string
  default     = "asia-southeast2"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "owner" {
  description = "Owner label for resources"
  type        = string
  default     = "platform-team"
}

variable "vpc_name" {
  description = "Name of the custom VPC"
  type        = string
  default     = "lz-vpc"
}

variable "subnet_name" {
  description = "Name of the private subnet"
  type        = string
  default     = "lz-private-subnet"
}

variable "subnet_cidr" {
  description = "CIDR range for the private subnet"
  type        = string
  default     = "10.10.0.0/24"
}

variable "allowed_admin_cidr" {
  description = "CIDR allowed to access administrative ports. Use a specific corporate/VPN IP range, not 0.0.0.0/0."
  type        = string
  default     = "10.0.0.0/8"
}

variable "admin_group_email" {
  description = "Google Group email for cloud administrators. Example: gcp-admins@example.com"
  type        = string
}

variable "log_dataset_id" {
  description = "BigQuery dataset ID for centralized project logs."
  type        = string
  default     = "audit_logs"
}

variable "log_retention_days" {
  description = "BigQuery table expiration in days for log storage."
  type        = number
  default     = 30
}

variable "billing_account_id" {
  description = "Billing account ID for budget alert. Example: 000000-000000-000000"
  type        = string
}

variable "budget_amount" {
  description = "Budget amount in USD for lab or dev environment."
  type        = number
  default     = 50
}

variable "notification_email_address" {
  description = "Email address used by monitoring and budget documentation. Budget notifications usually require Cloud Monitoring notification channels or billing IAM setup."
  type        = string
}
