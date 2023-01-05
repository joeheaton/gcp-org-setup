module "organization-iam" {
  source  = "terraform-google-modules/iam/google//modules/organizations_iam"
  version = "~> 7.4"

  organizations = [var.org_id]

  bindings = {

    "roles/billing.admin" = [
      "group:gcp-billing-admins@${var.org_domain}",
    ]

    "roles/resourcemanager.organizationAdmin" = [
      "group:gcp-organization-admins@${var.org_domain}",
    ]

  }
}

module "org-dev-iam" {
  source  = "terraform-google-modules/iam/google//modules/folders_iam"
  version = "~> 7.4"

  folders = [google_folder.org-dev.name]

  bindings = {

    "roles/compute.instanceAdmin.v1" = [
      "group:gcp-developers@${var.org_domain}",
    ]

    "roles/container.admin" = [
      "group:gcp-developers@${var.org_domain}",
    ]

  }
}

module "org-test-iam" {
  source  = "terraform-google-modules/iam/google//modules/folders_iam"
  version = "~> 7.4"

  folders = [google_folder.org-test.name]

  bindings = {

    "roles/compute.instanceAdmin.v1" = [
      "group:gcp-developers@${var.org_domain}",
    ]

    "roles/container.admin" = [
      "group:gcp-developers@${var.org_domain}",
    ]

  }
}
