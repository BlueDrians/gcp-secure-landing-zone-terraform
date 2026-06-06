output "vpc_name" {
  description = "VPC name"
  value       = module.network.vpc_name
}

output "subnet_name" {
  description = "subnet name"
  value       = module.network.subnet_name
}

output "workload_service_account_email" {
  description = "Service account for workload runtime identity."
  value       = module.iam.workload_service_account_email
}

output "log_dataset_id" {
  description = "BigQuery dataset used for log sink destination."
  value       = module.logging.dataset_id
}
