module "prj-logging" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 12.0"

  name       = "logging"
  project_id = "logging-${local.suffix}"
  org_id     = var.org_id
  folder_id  = google_folder.common.name

  billing_account = var.billing_account
}

module "prj-monitoring-dev" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 12.0"

  name       = "monitoring-${var.name_dev}"
  project_id = "monitoring-dev-${local.suffix}"
  org_id     = var.org_id
  folder_id  = google_folder.common.name

  billing_account = var.billing_account
}

module "prj-monitoring-test" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 12.0"

  name       = "monitoring-${var.name_test}"
  project_id = "monitoring-test-${local.suffix}"
  org_id     = var.org_id
  folder_id  = google_folder.common.name

  billing_account = var.billing_account
}

module "prj-monitoring-prod" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 12.0"

  name       = "monitoring-${var.name_prod}"
  project_id = "monitoring-prod-${local.suffix}"
  org_id     = var.org_id
  folder_id  = google_folder.common.name

  billing_account = var.billing_account
}

module "prj-vpc-host-dev" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 12.0"

  name       = "vpc-host-${var.name_dev}"
  project_id = "vpc-host-dev-${local.suffix}"
  org_id     = var.org_id
  folder_id  = google_folder.common.name

  enable_shared_vpc_host_project = true

  billing_account = var.billing_account
}

module "prj-vpc-host-test" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 12.0"

  name       = "vpc-host-${var.name_test}"
  project_id = "vpc-host-test-${local.suffix}"
  org_id     = var.org_id
  folder_id  = google_folder.common.name

  enable_shared_vpc_host_project = true

  billing_account = var.billing_account
}

module "prj-vpc-host-prod" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 12.0"

  name       = "vpc-host-${var.name_prod}"
  project_id = "vpc-host-prod-${local.suffix}"
  org_id     = var.org_id
  folder_id  = google_folder.common.name

  enable_shared_vpc_host_project = true

  billing_account = var.billing_account
}
