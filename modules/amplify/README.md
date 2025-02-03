<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.21.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.21.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_amplify_app.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/amplify_app) | resource |
| [aws_amplify_branch.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/amplify_branch) | resource |
| [aws_amplify_domain_association.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/amplify_domain_association) | resource |
| [aws_ssm_parameter.token](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_basic_auth_password"></a> [basic\_auth\_password](#input\_basic\_auth\_password) | Password for app access | `string` | `""` | no |
| <a name="input_basic_auth_username"></a> [basic\_auth\_username](#input\_basic\_auth\_username) | Username for app access | `string` | `""` | no |
| <a name="input_branch"></a> [branch](#input\_branch) | The branch for the Amplify app. | `string` | n/a | yes |
| <a name="input_branch_environment_variables"></a> [branch\_environment\_variables](#input\_branch\_environment\_variables) | The branch environment variables for the Amplify app. | `map(any)` | `{}` | no |
| <a name="input_build_spec"></a> [build\_spec](#input\_build\_spec) | The build spec for the Amplify app. | `string` | `null` | no |
| <a name="input_buildspec_file"></a> [buildspec\_file](#input\_buildspec\_file) | The location of buildspec file | `string` | n/a | yes |
| <a name="input_custom_image"></a> [custom\_image](#input\_custom\_image) | The custom image for the Amplify app. | `string` | n/a | yes |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | The domain name for the Amplify app. | `string` | n/a | yes |
| <a name="input_enable_basic_auth"></a> [enable\_basic\_auth](#input\_enable\_basic\_auth) | Enable basic authentication for the Amplify app | `bool` | `false` | no |
| <a name="input_environment_variables"></a> [environment\_variables](#input\_environment\_variables) | The environment variables for the Amplify app. | `map(any)` | `{}` | no |
| <a name="input_framework"></a> [framework](#input\_framework) | The framework for the Amplify app. | `string` | n/a | yes |
| <a name="input_iam_service_role_arn"></a> [iam\_service\_role\_arn](#input\_iam\_service\_role\_arn) | The role for amplify | `string` | n/a | yes |
| <a name="input_live_updates"></a> [live\_updates](#input\_live\_updates) | The live updates for the Amplify app. | `list(any)` | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the Amplify app. | `string` | n/a | yes |
| <a name="input_oauth_token"></a> [oauth\_token](#input\_oauth\_token) | The OAuth token for the Amplify app. | `string` | n/a | yes |
| <a name="input_platform"></a> [platform](#input\_platform) | The value of platform | `string` | n/a | yes |
| <a name="input_repository_url"></a> [repository\_url](#input\_repository\_url) | The repository URL for the Amplify app. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
