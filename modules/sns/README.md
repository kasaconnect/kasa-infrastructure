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
| [aws_sns_topic.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic_policy.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_policy) | resource |
| [aws_sns_topic_subscription.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic_subscription) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_delivery_policy"></a> [delivery\_policy](#input\_delivery\_policy) | The SNS delivery policy. More on AWS documentation: https://docs.aws.amazon.com/sns/latest/dg/DeliveryPolicies.html | `string` | `null` | no |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | The display name for the topic | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the topic. Topic names must be made up of only uppercase and lowercase ASCII letters, numbers, underscores, and hyphens, and must be between 1 and 256 characters long. For a FIFO (first-in-first-out) topic, the name must end with the .fifo suffix. If omitted, Terraform will assign a random, unique name. Conflicts with name\_prefix | `string` | n/a | yes |
| <a name="input_policy"></a> [policy](#input\_policy) | The fully-formed AWS policy as JSON. For more information about building AWS IAM policy documents with Terraform, see the AWS IAM Policy Document Guide: https://learn.hashicorp.com/terraform/aws/iam-policy | `string` | `null` | no |
| <a name="input_subscription"></a> [subscription](#input\_subscription) | Provides a resource for subscribing to SNS topics. Requires that an SNS topic exist for the subscription to attach to. | <pre>object({<br/>    protocol      = string<br/>    endpoint      = string<br/>    auto_confirms = bool<br/>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The ARN of the SNS topic, as a more obvious property (clone of id) |
| <a name="output_id"></a> [id](#output\_id) | The ARN of the SNS topic |
| <a name="output_name"></a> [name](#output\_name) | The name of the SNS topic |
| <a name="output_owner"></a> [owner](#output\_owner) | The AWS Account ID of the SNS topic owner |
<!-- END_TF_DOCS -->
