resource "google_bigquery_dataset" "logs" {
  project                    = var.project_id
  dataset_id                 = "${var.environment}_${var.dataset_id}"
  friendly_name              = "${var.environment} audit logs"
  description                = "Dataset for project-level audit and operational logs"
  location                   = "US"
  default_table_expiration_ms = var.retention_days * 24 * 60 * 60 * 1000
  labels                     = var.labels
}

resource "google_logging_project_sink" "audit_logs_to_bigquery" {
  project                = var.project_id
  name                   = "${var.environment}-audit-logs-to-bq"
  destination            = "bigquery.googleapis.com/projects/${var.project_id}/datasets/${google_bigquery_dataset.logs.dataset_id}"
  unique_writer_identity = true

  filter = <<-EOT
    logName:"cloudaudit.googleapis.com" OR severity>=ERROR
  EOT
}

resource "google_bigquery_dataset_iam_member" "sink_writer" {
  project    = var.project_id
  dataset_id = google_bigquery_dataset.logs.dataset_id
  role       = "roles/bigquery.dataEditor"
  member     = google_logging_project_sink.audit_logs_to_bigquery.writer_identity
}
