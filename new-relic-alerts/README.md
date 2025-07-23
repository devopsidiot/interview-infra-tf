<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_newrelic"></a> [newrelic](#provider\_newrelic) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [newrelic_alert_policy.glorify_policy](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/alert_policy) | resource |
| [newrelic_nrql_alert_condition.glorify_alert](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/nrql_alert_condition) | resource |
| [newrelic_alert_channel.email](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/data-sources/alert_channel) | data source |
| [newrelic_alert_channel.slack](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/data-sources/alert_channel) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_newrelic_alert_conditions"></a> [newrelic\_alert\_conditions](#input\_newrelic\_alert\_conditions) | n/a | <pre>map(object({<br>    aggregation_method             = optional(string),<br>    aggregation_delay              = optional(number),<br>    aggregation_timer              = optional(number),<br>    aggregation_window             = optional(number),<br>    close_violations_on_expiration = optional(bool),<br>    expiration_duration            = optional(number),<br>    type                           = optional(string),<br>    baseline_direction             = optional(string),<br>    slide_by                       = optional(number),<br>    violation_time_limit_seconds   = number,<br>    nrql = map(object({<br>      query             = string,<br>      evaluation_offset = optional(number)<br>    })),<br>    critical = optional(map(object({<br>      operator              = string,<br>      threshold             = number,<br>      threshold_duration    = number,<br>      threshold_occurrences = string<br>    }))),<br>    warning = optional(map(object({<br>      operator              = string,<br>      threshold             = number,<br>      threshold_duration    = number,<br>      threshold_occurrences = string<br>    })))<br>  }))</pre> | n/a | yes |
| <a name="input_newrelic_alert_email_channel_name"></a> [newrelic\_alert\_email\_channel\_name](#input\_newrelic\_alert\_email\_channel\_name) | n/a | `string` | `""` | no |
| <a name="input_newrelic_alert_pagerduty_channel_name"></a> [newrelic\_alert\_pagerduty\_channel\_name](#input\_newrelic\_alert\_pagerduty\_channel\_name) | n/a | `string` | `""` | no |
| <a name="input_newrelic_alert_policy"></a> [newrelic\_alert\_policy](#input\_newrelic\_alert\_policy) | n/a | `string` | n/a | yes |
| <a name="input_newrelic_alert_policy_incident_preference"></a> [newrelic\_alert\_policy\_incident\_preference](#input\_newrelic\_alert\_policy\_incident\_preference) | n/a | `string` | n/a | yes |
| <a name="input_newrelic_alert_slack_channel_name"></a> [newrelic\_alert\_slack\_channel\_name](#input\_newrelic\_alert\_slack\_channel\_name) | n/a | `string` | `""` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->