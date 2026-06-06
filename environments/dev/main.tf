locals {
  common_labels = {
    environment = var.environment
    owner       = var.owner
    managed_by  = "terraform"
    project     = "secure-landing-zone"
  }

  required_apis = [
    "compute.googleapis.com",
    "iam.googleapis.com",
    "logging.googleapis.com",
    "monitoring.googleapis.com",
    "billingbudgets.googleapis.com",
    "bigquery.googleapis.com"
  ]
}

resource "google_project_service" "required" {
  for_each = toset(local.required_apis)

  project            = var.project_id
  service            = each.value
  disable_on_destroy = false
}

module "network" {
  source = "../../modules/network"

  project_id        = var.project_id
  region            = var.region
  environment       = var.environment
  vpc_name          = var.vpc_name
  subnet_name       = var.subnet_name
  subnet_cidr       = var.subnet_cidr
  allowed_admin_cidr = var.allowed_admin_cidr
  labels            = local.common_labels

  depends_on = [google_project_service.required]
}

module "iam" {
  source = "../../modules/iam"

  project_id        = var.project_id
  environment       = var.environment
  admin_group_email = var.admin_group_email
  labels            = local.common_labels

  depends_on = [google_project_service.required]
}

module "logging" {
  source = "../../modules/logging"

  project_id     = var.project_id
  environment    = var.environment
  dataset_id     = var.log_dataset_id
  retention_days = var.log_retention_days
  labels         = local.common_labels

  depends_on = [google_project_service.required]
}

module "monitoring" {
  source = "../../modules/monitoring"

  project_id                 = var.project_id
  notification_email_address = var.notification_email_address
  labels                     = local.common_labels

  depends_on = [google_project_service.required]
}

module "budget" {
  source = "../../modules/budget"

  billing_account_id         = var.billing_account_id
  project_id                 = var.project_id
  budget_amount              = var.budget_amount
  notification_email_address = var.notification_email_address

  depends_on = [google_project_service.required]
}
