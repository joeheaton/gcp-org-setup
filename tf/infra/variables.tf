variable "billing_account" {
  description = "The ID of the billing account to associate projects with"
  type        = string
}

variable "org_id" {
  description = "The organization id for the associated resources"
  type        = string
}

variable "org_name" {
  description = "The organization display name"
  type        = string
  default     = "myOrg"
}

variable "org_domain" {
  description = "The organization domain name"
  type        = string
  default     = "example.com"
}

variable "org_logging_destination" {
  description = "The organisation logging destination - https://cloud.google.com/logging/docs/routing/overview#storing"
  type        = string
  default     = "global"
}

variable "name_prod" {
  description = "Name used for Production resources"
  type        = string
  default     = "prod"
}

variable "name_test" {
  description = "Name used for Testing resources"
  type        = string
  default     = "test"
}

variable "name_dev" {
  description = "Name used for Development resources"
  type        = string
  default     = "dev"
}
