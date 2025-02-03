<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_event_rule.eventbridge_rule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_target.eventbridge_target](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_target) | resource |
| [aws_lambda_permission.allow_eventbridge](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | The description of the EventBridge rule. | `string` | `""` | no |
| <a name="input_lambda_function_name"></a> [lambda\_function\_name](#input\_lambda\_function\_name) | The name of the Lambda function to be invoked by the EventBridge rule. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the EventBridge rule. | `string` | n/a | yes |
| <a name="input_schedule_expression"></a> [schedule\_expression](#input\_schedule\_expression) | The schedule expression for the EventBridge rule. | `string` | n/a | yes |
| <a name="input_target_arn"></a> [target\_arn](#input\_target\_arn) | The ARN of the target for the EventBridge rule. | `string` | n/a | yes |
| <a name="input_target_id"></a> [target\_id](#input\_target\_id) | The ID of the target for the EventBridge rule. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_eventbridge_rule_arn"></a> [eventbridge\_rule\_arn](#output\_eventbridge\_rule\_arn) | The ARN of the EventBridge rule. |
| <a name="output_eventbridge_target_arn"></a> [eventbridge\_target\_arn](#output\_eventbridge\_target\_arn) | The ARN of the target for the EventBridge rule. |
| <a name="output_eventbridge_target_id"></a> [eventbridge\_target\_id](#output\_eventbridge\_target\_id) | The ID of the target for the EventBridge rule. |
<!-- END_TF_DOCS -->