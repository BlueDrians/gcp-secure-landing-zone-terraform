output "workload_service_account_email" {
  description = "Workload service account email"
  value       = google_service_account.workload.email
}
