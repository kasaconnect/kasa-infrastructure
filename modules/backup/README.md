<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_backup_plan.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/backup_plan) | resource |
| [aws_backup_region_settings.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/backup_region_settings) | resource |
| [aws_backup_selection.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/backup_selection) | resource |
| [aws_backup_vault.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/backup_vault) | resource |
| [aws_backup_vault_lock_configuration.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/backup_vault_lock_configuration) | resource |
| [aws_backup_vault_policy.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/backup_vault_policy) | resource |
| [aws_iam_role.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.backup_service_role_policy_for_backup](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.backup_service_role_policy_for_restores](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.backup_service_role_policy_for_s3_backup](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.backup_service_role_policy_for_s3_restore](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_ssm_parameter.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_iam_policy_document.backup](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.copy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_kms_key_arn"></a> [kms\_key\_arn](#input\_kms\_key\_arn) | The ARN of the KMS key used to encrypt the backups | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the resources | `string` | n/a | yes |
| <a name="input_not_resources"></a> [not\_resources](#input\_not\_resources) | An array of strings that either contain Amazon Resource Names (ARNs) or match patterns of resources to exclude from a backup plan. | `list(string)` | `null` | no |
| <a name="input_resources"></a> [resources](#input\_resources) | An array of strings that either contain Amazon Resource Names (ARNs) or match patterns of resources to assign to a backup plan. | `list(string)` | `null` | no |
| <a name="input_role_name"></a> [role\_name](#input\_role\_name) | The name of the IAM role to assign to the backup plan | `string` | n/a | yes |
| <a name="input_rules"></a> [rules](#input\_rules) | A CRON expression specifying when AWS Backup initiates a backup job. | `list(map(string))` | n/a | yes |
| <a name="input_tags_condition"></a> [tags\_condition](#input\_tags\_condition) | Tag-based conditions used to specify a set of resources to assign to a backup plan. | `map(any)` | `{}` | no |
| <a name="input_target_vault"></a> [target\_vault](#input\_target\_vault) | The ARN of the backup vault to copy the backup plan. | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_plan_id"></a> [plan\_id](#output\_plan\_id) | The id of the backup plan |
| <a name="output_selection_id"></a> [selection\_id](#output\_selection\_id) | Backup Selection identifier |
| <a name="output_vault_arn"></a> [vault\_arn](#output\_vault\_arn) | The ARN of the vault |
| <a name="output_vault_name"></a> [vault\_name](#output\_vault\_name) | The name of the vault |
| <a name="output_vault_recovery_points"></a> [vault\_recovery\_points](#output\_vault\_recovery\_points) | The number of recovery points that are stored in a backup vault |
<!-- END_TF_DOCS -->
