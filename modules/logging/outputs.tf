output "dataset_id" {
  description = "BigQuery dataset ID"
  value       = google_bigquery_dataset.logs.dataset_id
}

output "log_sink_name" {
  description = "Logging sink name"
  value       = google_logging_project_sink.audit_logs_to_bigquery.name
}
