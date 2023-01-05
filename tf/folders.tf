resource "google_folder" "common" {
  display_name = "Common"
  parent       = "organizations/${var.org_id}"
}

resource "google_folder" "org" {
  display_name = var.org_name
  parent       = "organizations/${var.org_id}"
}

resource "google_folder" "org-dev" {
  display_name = "Dev"
  parent       = google_folder.org.name
}

resource "google_folder" "org-live" {
  display_name = "Live"
  parent       = google_folder.org.name
}

resource "google_folder" "org-test" {
  display_name = "Test"
  parent       = google_folder.org.name
}
