resource "google_compute_network" "main" {
  project                 = var.project_id
  name                    = "${var.environment}-${var.vpc_name}"
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
  description             = "Custom VPC for secure landing zone baseline"
}

resource "google_compute_subnetwork" "private" {
  project                  = var.project_id
  name                     = "${var.environment}-${var.subnet_name}"
  ip_cidr_range            = var.subnet_cidr
  region                   = var.region
  network                  = google_compute_network.main.id
  private_ip_google_access = true
  description              = "Private subnet with Private Google Access enabled"
}

resource "google_compute_router" "main" {
  project = var.project_id
  name    = "${var.environment}-cloud-router"
  region  = var.region
  network = google_compute_network.main.id
}

resource "google_compute_router_nat" "main" {
  project                            = var.project_id
  name                               = "${var.environment}-cloud-nat"
  router                             = google_compute_router.main.name
  region                             = var.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  subnetwork {
    name                    = google_compute_subnetwork.private.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}

resource "google_compute_firewall" "allow_internal" {
  project = var.project_id
  name    = "${var.environment}-allow-internal"
  network = google_compute_network.main.name

  direction     = "INGRESS"
  source_ranges = [var.subnet_cidr]

  allow {
    protocol = "tcp"
  }

  allow {
    protocol = "udp"
  }

  allow {
    protocol = "icmp"
  }

  description = "Allow internal communication inside landing zone subnet"
}

resource "google_compute_firewall" "allow_admin_ssh_iap_or_vpn" {
  project = var.project_id
  name    = "${var.environment}-allow-admin-ssh"
  network = google_compute_network.main.name

  direction     = "INGRESS"
  source_ranges = [var.allowed_admin_cidr]
  target_tags   = ["admin-access"]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  description = "Allow SSH only from approved admin CIDR. Replace with IAP or VPN range for production"
}

resource "google_compute_firewall" "deny_all_ingress" {
  project = var.project_id
  name    = "${var.environment}-deny-all-ingress"
  network = google_compute_network.main.name

  direction     = "INGRESS"
  priority      = 65534
  source_ranges = ["0.0.0.0/0"]

  deny {
    protocol = "all"
  }

  description = "Explicit deny-all ingress baseline. Higher-priority allow rules must be intentional"
}
