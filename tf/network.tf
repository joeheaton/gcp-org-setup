# VPC and Subnets
module "vpc-host-dev" {
  source  = "terraform-google-modules/network/google"
  version = "~> 5.0"

  project_id   = module.prj-vpc-host-dev.project_id
  network_name = "vpc-host-${var.name_dev}"
  routing_mode = "GLOBAL"

  subnets = [
    {
      subnet_name               = "subnet-${var.name_dev}-1"
      subnet_ip                 = "10.2.2.0/24"
      subnet_region             = "europe-west1"
      subnet_private_access     = true
      subnet_flow_logs          = true
      subnet_flow_logs_sampling = "0.5"
      subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
      subnet_flow_logs_interval = "INTERVAL_10_MIN"
    },
    {
      subnet_name               = "subnet-${var.name_dev}-2"
      subnet_ip                 = "10.2.4.0/24"
      subnet_region             = "europe-west2"
      subnet_private_access     = true
      subnet_flow_logs          = true
      subnet_flow_logs_sampling = "0.5"
      subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
      subnet_flow_logs_interval = "INTERVAL_10_MIN"
    },
  ]

  routes = [
    {
      name              = "rt-vpc-host-${var.name_dev}-1000-egress-internet-default"
      description       = "Tag based route through IGW to access internet"
      destination_range = "0.0.0.0/0"
      priority          = "1000"
      next_hop_internet = "true"
      tags              = "egress-internet"
    },
  ]
}

# Firewall Rules
resource "google_compute_firewall" "vpc-host-dev-allow-iap-rdp" {
  name      = "vpc-host-${var.name_dev}-allow-iap-rdp"
  network   = module.vpc-host-dev.network_name
  project   = module.prj-vpc-host-dev.project_id
  direction = "INGRESS"
  priority  = 10000

  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }

  allow {
    protocol = "tcp"
    ports    = ["3389", ]
  }

  source_ranges = [
    "35.235.240.0/20",
  ]
}

resource "google_compute_firewall" "vpc-host-dev-allow-iap-ssh" {
  name      = "vpc-host-${var.name_dev}-allow-iap-ssh"
  network   = module.vpc-host-dev.network_name
  project   = module.prj-vpc-host-dev.project_id
  direction = "INGRESS"
  priority  = 10000

  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", ]
  }

  source_ranges = [
    "35.235.240.0/20",
  ]
}
resource "google_compute_firewall" "vpc-host-dev-allow-icmp" {
  name      = "vpc-host-${var.name_dev}-allow-icmp"
  network   = module.vpc-host-dev.network_name
  project   = module.prj-vpc-host-dev.project_id
  direction = "INGRESS"
  priority  = 10000

  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }

  allow {
    protocol = "icmp"
  }

  source_ranges = [
    "10.128.0.0/9",
  ]
}

# VPC and Subnets
module "vpc-host-live" {
  source  = "terraform-google-modules/network/google"
  version = "~> 5.0"

  project_id   = module.prj-vpc-host-prod.project_id
  network_name = "vpc-host-live"
  routing_mode = "GLOBAL"

  subnets = [

    {
      subnet_name               = "subnet-live-1"
      subnet_ip                 = "10.0.2.0/24"
      subnet_region             = "europe-west1"
      subnet_private_access     = true
      subnet_flow_logs          = true
      subnet_flow_logs_sampling = "0.5"
      subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
      subnet_flow_logs_interval = "INTERVAL_10_MIN"
    },
    {
      subnet_name               = "subnet-live-2"
      subnet_ip                 = "10.0.4.0/24"
      subnet_region             = "europe-west2"
      subnet_private_access     = true
      subnet_flow_logs          = true
      subnet_flow_logs_sampling = "0.5"
      subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
      subnet_flow_logs_interval = "INTERVAL_10_MIN"
    },
  ]

  routes = [
    {
      name              = "rt-vpc-host-live-1000-egress-internet-default"
      description       = "Tag based route through IGW to access internet"
      destination_range = "0.0.0.0/0"
      priority          = "1000"
      next_hop_internet = "true"
      tags              = "egress-internet"
    },
  ]
}

# Firewall Rules
resource "google_compute_firewall" "vpc-host-live-allow-iap-rdp" {
  name      = "vpc-host-live-allow-iap-rdp"
  network   = module.vpc-host-live.network_name
  project   = module.prj-vpc-host-prod.project_id
  direction = "INGRESS"
  priority  = 10000

  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }

  allow {
    protocol = "tcp"
    ports    = ["3389", ]
  }

  source_ranges = [
    "35.235.240.0/20",
  ]
}

resource "google_compute_firewall" "vpc-host-live-allow-iap-ssh" {
  name      = "vpc-host-live-allow-iap-ssh"
  network   = module.vpc-host-live.network_name
  project   = module.prj-vpc-host-prod.project_id
  direction = "INGRESS"
  priority  = 10000

  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", ]
  }

  source_ranges = [
    "35.235.240.0/20",
  ]
}

resource "google_compute_firewall" "vpc-host-live-allow-icmp" {
  name      = "vpc-host-live-allow-icmp"
  network   = module.vpc-host-live.network_name
  project   = module.prj-vpc-host-prod.project_id
  direction = "INGRESS"
  priority  = 10000

  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }

  allow {
    protocol = "icmp"
  }

  source_ranges = [
    "10.128.0.0/9",
  ]
}

# VPC and Subnets
module "vpc-host-test" {
  source  = "terraform-google-modules/network/google"
  version = "~> 5.0"

  project_id   = module.prj-vpc-host-test.project_id
  network_name = "vpc-host-${var.name_test}"
  routing_mode = "GLOBAL"

  subnets = [
    {
      subnet_name               = "subnet-${var.name_test}-1"
      subnet_ip                 = "10.1.2.0/24"
      subnet_region             = "europe-west1"
      subnet_private_access     = true
      subnet_flow_logs          = true
      subnet_flow_logs_sampling = "0.5"
      subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
      subnet_flow_logs_interval = "INTERVAL_10_MIN"
    },
    {
      subnet_name               = "subnet-${var.name_test}-2"
      subnet_ip                 = "10.1.4.0/24"
      subnet_region             = "europe-west2"
      subnet_private_access     = true
      subnet_flow_logs          = true
      subnet_flow_logs_sampling = "0.5"
      subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
      subnet_flow_logs_interval = "INTERVAL_10_MIN"
    },
  ]

  routes = [
    {
      name              = "rt-vpc-host-${var.name_test}-1000-egress-internet-default"
      description       = "Tag based route through IGW to access internet"
      destination_range = "0.0.0.0/0"
      priority          = "1000"
      next_hop_internet = "true"
      tags              = "egress-internet"
    },
  ]
}

# Firewall Rules
resource "google_compute_firewall" "vpc-host-test-allow-iap-rdp" {
  name      = "vpc-host-${var.name_test}-allow-iap-rdp"
  network   = module.vpc-host-test.network_name
  project   = module.prj-vpc-host-test.project_id
  direction = "INGRESS"
  priority  = 10000

  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }

  allow {
    protocol = "tcp"
    ports    = ["3389", ]
  }

  source_ranges = [
    "35.235.240.0/20",
  ]
}

resource "google_compute_firewall" "vpc-host-test-allow-iap-ssh" {
  name      = "vpc-host-${var.name_test}-allow-iap-ssh"
  network   = module.vpc-host-test.network_name
  project   = module.prj-vpc-host-test.project_id
  direction = "INGRESS"
  priority  = 10000

  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", ]
  }

  source_ranges = [
    "35.235.240.0/20",
  ]
}

resource "google_compute_firewall" "vpc-host-test-allow-icmp" {
  name      = "vpc-host-${var.name_test}-allow-icmp"
  network   = module.vpc-host-test.network_name
  project   = module.prj-vpc-host-test.project_id
  direction = "INGRESS"
  priority  = 10000

  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }

  allow {
    protocol = "icmp"
  }

  source_ranges = [
    "10.128.0.0/9",
  ]
}
