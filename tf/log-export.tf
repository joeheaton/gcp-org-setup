module "logsink-logbucketsink" {
  source  = "terraform-google-modules/log-export/google"
  version = "~> 7.3.0"

  destination_uri      = module.org-logging-destination.destination_uri
  log_sink_name        = "logbucketsink-${local.suffix}"
  parent_resource_id   = var.org_id
  parent_resource_type = "organization"
  include_children     = true
}

module "org-logging-destination" {
  source  = "terraform-google-modules/log-export/google//modules/logbucket"
  version = "~> 7.4.1"

  project_id               = module.prj-logging.project_id
  name                     = "${var.org_name}-logging-${local.suffix}"
  location                 = var.org_logging_destination
  retention_days           = 30
  log_sink_writer_identity = module.logsink-logbucketsink.writer_identity
}
