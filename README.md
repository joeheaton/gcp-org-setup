# Google Cloud Organisation Setup

This repository is based on the [Organization setup wizard](https://cloud.google.com/resource-manager/docs/organization-setup) & [Google Secure Foundations Blueprint](https://cloud.google.com/architecture/security-foundations) recommendations, building ontop of the generated Terraform provided by the Organization setup wizard.

Terraform configures your Google Cloud Organisation with:

- Admin IAM bindings
- Simple team-orientated folder structure
- Shared VPC networking
- Org-level logging to bucket

## Requirements

Organisation has been created and configured with Google Cloud Identity.

Run the Terraform as a user with the `Organisation Administrator` IAM role.

Tested with Terraform `v1.3.7` & latest Google Cloud SDK.

## Variables

Populate `tf/terraform.tfvars`

- `billing_account` with your Billing Account ID, found at [Billing](https://console.cloud.google.com/billing)
- `org_id` with your Organisation ID, found in the ID column of the first item in [Manage Resources](https://console.cloud.google.com/cloud-resource-manager)
- `org_name` with your Organisation Name, only used in top-level folder name
- `org_domain` with your Organisation Domain name, i.e. heaton.dev, used in IAM groups

### Naming subsitutions

Alter the names of various resources

- `name_prod` subsitute the name of the production resources
- `name_test` subsitute the name of the testing resources
- `name_dev` subsitute the name of the development resources

**Note** these only affect the Display Name, as to avoid destructive changes if altered after first deployment

## Design Decisions

- `project_id` contain `prod`, `test` & `dev` regardless of `name_prod`, `name_test` & `name_dev` variables. This avoids destruction if the `name_*` variables are ever changed.

## Credits

Modules used:

- [terraform-google-modules/terraform-google-iam/](https://github.com/terraform-google-modules//terraform-google-iam/)
- [terraform-google-modules/terraform-google-log-export/](https://github.com/terraform-google-modules//terraform-google-log-export/)
- [terraform-google-modules/terraform-google-network/](https://github.com/terraform-google-modules//terraform-google-network/)
- [terraform-google-modules/terraform-google-project-factory/](https://github.com/terraform-google-modules//terraform-google-project-factory/)
