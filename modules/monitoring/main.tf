resource "google_monitoring_notification_channel" "email" {
  project      = var.project_id
  display_name = "Platform Team Email"
  type         = "email"

  labels = {
    email_address = var.notification_email_address
  }
}

resource "google_monitoring_alert_policy" "high_vm_cpu" {
  project      = var.project_id
  display_name = "High VM CPU Utilization"
  combiner     = "OR"
  enabled      = true

  conditions {
    display_name = "VM CPU utilization above 80 percent"

    condition_threshold {
      filter          = "resource.type = \"gce_instance\" AND metric.type = \"compute.googleapis.com/instance/cpu/utilization\""
      duration        = "300s"
      comparison      = "COMPARISON_GT"
      threshold_value = 0.8

      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_MEAN"
      }
    }
  }

  notification_channels = [google_monitoring_notification_channel.email.name]

  documentation {
    content   = "CPU utilization is above 80 percent for 5 minutes. Check workload behavior, autoscaling policy, and instance sizing."
    mime_type = "text/markdown"
  }
}
