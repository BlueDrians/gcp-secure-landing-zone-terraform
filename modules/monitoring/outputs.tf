output "notification_channel_name" {
  description = "Monitoring notification channel resource name"
  value       = google_monitoring_notification_channel.email.name
}

output "high_cpu_alert_policy_name" {
  description = "High CPU alert policy name"
  value       = google_monitoring_alert_policy.high_vm_cpu.name
}
