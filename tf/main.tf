locals {
  suffix = random_string.suffix.id
}

resource "random_string" "suffix" {
  length  = 2
  special = false
  lower   = true
  upper   = true
  numeric = true
}
