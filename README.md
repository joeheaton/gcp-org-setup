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

| Variable | Value |
| --- | --- |
| `billing_account` | Your Billing Account ID, found at [Billing](https://console.cloud.google.com/billing) |
| `org_id` | Your Organisation ID, found in the ID column of the first item in [Manage Resources](https://console.cloud.google.com/cloud-resource-manager) |
| `org_name` | Your Organisation Name, only used in top-level folder name |
| `org_domain` | Your Organisation Domain name, i.e. heaton.dev, used in IAM groups |

### Naming subsitutions

Alter the names of various resources

| Variable | Value |
| --- | --- |
| `name_prod` | Subsitute name for production resources |
| `name_test` | Subsitute name for testing resources |
| `name_dev` | Subsitute name for development resources |

**Note** these only affect the Display Name, as this avoids destructive changes if altered after the first deployment

## Design Decisions

- Each project's `project_id` contain `prod`, `test` & `dev` regardless of `name_prod`, `name_test` & `name_dev` variables. This avoids destruction if the `name_*` variables are ever changed.
- Terraform folders `org` and `infra` are split to enable destroying infrastructure without removing critical org-wide IAM

## Usage

Run from the root of this repository:

```sh
# Org
terraform -chdir=tf/org init
terraform -chdir=tf/org apply -var-file=../terraform.tfvars

# Infra
terraform -chdir=tf/infra init
terraform -chdir=tf/infra apply -var-file=../terraform.tfvars
```

Destroy infra:

```sh
terraform -chdir=tf/infra destroy -var-file=../terraform.tfvars
```

## Errors

- When destroying `google_folder.common` you will likely encounter the error `FOLDER_TO_DELETE_NON_EMPTY_VIOLATION`, this is because the logsink still exists.

## Credits

Terraform modules used:

- [terraform-google-modules/terraform-google-iam/](https://github.com/terraform-google-modules//terraform-google-iam/)
- [terraform-google-modules/terraform-google-log-export/](https://github.com/terraform-google-modules//terraform-google-log-export/)
- [terraform-google-modules/terraform-google-network/](https://github.com/terraform-google-modules//terraform-google-network/)
- [terraform-google-modules/terraform-google-project-factory/](https://github.com/terraform-google-modules//terraform-google-project-factory/)
