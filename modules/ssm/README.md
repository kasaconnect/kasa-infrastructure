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
| [aws_ssm_parameter.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | Description of the parameter. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the parameter. If the name contains a path (e.g., any forward slashes (/)), it must be fully qualified with a leading forward slash (/). For additional requirements and constraints, see the AWS SSM User Guide. | `string` | n/a | yes |
| <a name="input_type"></a> [type](#input\_type) | Type of the parameter. Valid types are String, StringList and SecureString. | `string` | n/a | yes |
| <a name="input_value"></a> [value](#input\_value) | Value of the parameter. This value is always marked as sensitive in the Terraform plan output, regardless of type. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The SSM parameter ARN |
| <a name="output_name"></a> [name](#output\_name) | The SSM parameter name |
| <a name="output_value"></a> [value](#output\_value) | The SSM parameter value |
<!-- END_TF_DOCS -->
