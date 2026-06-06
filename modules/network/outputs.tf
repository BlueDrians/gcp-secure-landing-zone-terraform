output "vpc_name" {
  description = "VPC name"
  value       = google_compute_network.main.name
}

output "vpc_id" {
  description = "VPC ID"
  value       = google_compute_network.main.id
}

output "subnet_name" {
  description = "Subnet name"
  value       = google_compute_subnetwork.private.name
}

output "subnet_id" {
  description = "Subnet ID"
  value       = google_compute_subnetwork.private.id
}
