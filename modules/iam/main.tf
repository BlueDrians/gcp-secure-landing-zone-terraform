resource "google_service_account" "workload" {
  project      = var.project_id
  account_id   = "${var.environment}-workload-sa"
  display_name = "${var.environment} workload service account"
  description  = "Dedicated runtime identity for landing zone workloads"
}

resource "google_project_iam_member" "admin_group_viewer" {
  project = var.project_id
  role    = "roles/viewer"
  member  = "group:${var.admin_group_email}"
}

resource "google_project_iam_member" "admin_group_log_viewer" {
  project = var.project_id
  role    = "roles/logging.viewer"
  member  = "group:${var.admin_group_email}"
}

resource "google_project_iam_member" "admin_group_monitoring_viewer" {
  project = var.project_id
  role    = "roles/monitoring.viewer"
  member  = "group:${var.admin_group_email}"
}

resource "google_project_iam_member" "workload_log_writer" {
  project = var.project_id
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_service_account.workload.email}"
}

resource "google_project_iam_member" "workload_metric_writer" {
  project = var.project_id
  role    = "roles/monitoring.metricWriter"
  member  = "serviceAccount:${google_service_account.workload.email}"
}
