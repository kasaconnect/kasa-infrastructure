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
| [aws_cloudwatch_metric_alarm.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alarm_actions"></a> [alarm\_actions](#input\_alarm\_actions) | The list of actions to take when the alarm transitions into an ALARM state | `string` | n/a | yes |
| <a name="input_alarm_description"></a> [alarm\_description](#input\_alarm\_description) | The description for the alarm | `string` | n/a | yes |
| <a name="input_alarm_name"></a> [alarm\_name](#input\_alarm\_name) | The name of the alarm | `string` | n/a | yes |
| <a name="input_comparison_operator"></a> [comparison\_operator](#input\_comparison\_operator) | The comparison operator to use | `string` | n/a | yes |
| <a name="input_dimensions"></a> [dimensions](#input\_dimensions) | A map of dimension key and value | `map(string)` | n/a | yes |
| <a name="input_evaluation_periods"></a> [evaluation\_periods](#input\_evaluation\_periods) | The number of periods over which data is compared to the specified threshold | `number` | n/a | yes |
| <a name="input_metric_name"></a> [metric\_name](#input\_metric\_name) | The name of the metric to evaluate | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | The namespace of the metric to evaluate | `string` | n/a | yes |
| <a name="input_ok_actions"></a> [ok\_actions](#input\_ok\_actions) | The list of actions to take when the alarm transitions into an OK state | `string` | n/a | yes |
| <a name="input_period"></a> [period](#input\_period) | The period in seconds over which the specified statistic is applied | `number` | n/a | yes |
| <a name="input_statistic"></a> [statistic](#input\_statistic) | The statistic to apply to the alarm's associated metric | `string` | n/a | yes |
| <a name="input_threshold"></a> [threshold](#input\_threshold) | The value against which the specified statistic is compared | `number` | n/a | yes |
| <a name="input_unit"></a> [unit](#input\_unit) | The unit for the alarm's associated metric | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
