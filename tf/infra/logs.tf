module "org-logsink" {
  source  = "terraform-google-modules/log-export/google"
  version = "~> 7.3.0"

  destination_uri      = module.org-logging-destination.destination_uri
  log_sink_name        = "org-logsink"
  parent_resource_id   = var.org_id
  parent_resource_type = "organization"
  include_children     = true
}

module "org-logging-destination" {
  source  = "terraform-google-modules/log-export/google//modules/logbucket"
  version = "~> 7.4.1"

  project_id               = module.prj-logging.project_id
  name                     = "${var.org_name}-logging"
  location                 = var.org_logging_destination
  retention_days           = 30
  log_sink_writer_identity = module.org-logsink.writer_identity
}
