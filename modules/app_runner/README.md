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
| [aws_apprunner_auto_scaling_configuration_version.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apprunner_auto_scaling_configuration_version) | resource |
| [aws_apprunner_observability_configuration.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apprunner_observability_configuration) | resource |
| [aws_apprunner_service.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apprunner_service) | resource |
| [aws_apprunner_vpc_connector.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apprunner_vpc_connector) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_deployments_enabled"></a> [auto\_deployments\_enabled](#input\_auto\_deployments\_enabled) | Whether continuous integration from the source repository is enabled for the App Runner service. If set to true, each repository change (source code commit or new image version) starts a deployment. Defaults to true. | `bool` | n/a | yes |
| <a name="input_auto_scaling_configuration_name"></a> [auto\_scaling\_configuration\_name](#input\_auto\_scaling\_configuration\_name) | The name of autoscaling configuration | `string` | n/a | yes |
| <a name="input_code_configuration"></a> [code\_configuration](#input\_code\_configuration) | Configuration for building and running the service from a source code repository. | <pre>object({<br/>    build_command = string<br/>    port          = number<br/>    runtime       = string<br/>    start_command = string<br/>  })</pre> | n/a | yes |
| <a name="input_configuration_source"></a> [configuration\_source](#input\_configuration\_source) | Source of the App Runner configuration. Valid values: REPOSITORY, API. | `string` | n/a | yes |
| <a name="input_connection_arn"></a> [connection\_arn](#input\_connection\_arn) | ARN of the App Runner connection that enables the App Runner service to connect to a source repository. Required for GitHub code repositories. | `string` | n/a | yes |
| <a name="input_cpu"></a> [cpu](#input\_cpu) | Number of CPU units reserved for each instance of your App Runner service represented as a String. Defaults to 1024 | `number` | n/a | yes |
| <a name="input_environment_secrets"></a> [environment\_secrets](#input\_environment\_secrets) | Secrets and parameters available to your service as environment variables. A map of key/value pairs, where the key is the desired name of the Secret in the environment (i.e. it does not have to match the name of the secret in Secrets Manager or SSM Parameter Store), and the value is the ARN of the secret from AWS Secrets Manager or the ARN of the parameter in AWS SSM Parameter Store. | `any` | n/a | yes |
| <a name="input_environment_variables"></a> [environment\_variables](#input\_environment\_variables) | Environment variables available to your running App Runner service. A map of key/value pairs. Keys with a prefix of AWSAPPRUNNER are reserved for system use and aren't valid. | `map(string)` | n/a | yes |
| <a name="input_instance_role_arn"></a> [instance\_role\_arn](#input\_instance\_role\_arn) | The ARN of the IAM role to associate with the App Runner instance | `string` | `""` | no |
| <a name="input_is_publicly_accessible"></a> [is\_publicly\_accessible](#input\_is\_publicly\_accessible) | Specifies whether your App Runner service is publicly accessible. To make the service publicly accessible set it to True. To make the service privately accessible, from only within an Amazon VPC set it to False. | `bool` | n/a | yes |
| <a name="input_max_size"></a> [max\_size](#input\_max\_size) | Maximal number of instances that App Runner provisions for your service | `string` | n/a | yes |
| <a name="input_memory"></a> [memory](#input\_memory) | Amount of memory, in MB or GB, reserved for each instance of your App Runner service. Defaults to 2048 | `number` | n/a | yes |
| <a name="input_min_size"></a> [min\_size](#input\_min\_size) | Minimal number of instances that App Runner provisions for your service | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the service. | `string` | n/a | yes |
| <a name="input_observability_enabled"></a> [observability\_enabled](#input\_observability\_enabled) | When true, an observability configuration resource is associated with the service | `bool` | n/a | yes |
| <a name="input_repository_url"></a> [repository\_url](#input\_repository\_url) | Location of the repository that contains the source code. | `string` | n/a | yes |
| <a name="input_type"></a> [type](#input\_type) | Type of version identifier. For a git-based repository, branches represent versions | `string` | n/a | yes |
| <a name="input_value"></a> [value](#input\_value) | Source code version. For a git-based repository, a branch name maps to a specific version. App Runner uses the most recent commit to the branch. | `string` | n/a | yes |
| <a name="input_vpc_connector_sgs"></a> [vpc\_connector\_sgs](#input\_vpc\_connector\_sgs) | List of IDs of security groups that App Runner should use for access to AWS resources under the specified subnets. If not specified, App Runner uses the default security group of the Amazon VPC. The default security group allows all outbound traffic. | `list(string)` | n/a | yes |
| <a name="input_vpc_connector_subnets"></a> [vpc\_connector\_subnets](#input\_vpc\_connector\_subnets) | List of IDs of subnets that App Runner should use when it associates your service with a custom Amazon VPC. Specify IDs of subnets of a single Amazon VPC. App Runner determines the Amazon VPC from the subnets you specify. | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | ARN of the App Runner service |
| <a name="output_default_domain"></a> [default\_domain](#output\_default\_domain) | n/a |
| <a name="output_service_id"></a> [service\_id](#output\_service\_id) | An alphanumeric ID that App Runner generated for this service. Unique within the AWS Region |
| <a name="output_service_name"></a> [service\_name](#output\_service\_name) | Name of the service |
| <a name="output_service_url"></a> [service\_url](#output\_service\_url) | Url of the services |
<!-- END_TF_DOCS -->
