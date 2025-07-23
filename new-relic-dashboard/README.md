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
| [newrelic_one_dashboard.glorify_dashboard](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/one_dashboard) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_newrelic_dashboard_name"></a> [newrelic\_dashboard\_name](#input\_newrelic\_dashboard\_name) | n/a | `string` | n/a | yes |
| <a name="input_newrelic_dashboard_pages"></a> [newrelic\_dashboard\_pages](#input\_newrelic\_dashboard\_pages) | My Dashboard | <pre>map(object({<br>    line_widgets = optional(map(object({<br>      widget_line_nrql   = string<br>      widget_line_column = number<br>      widget_line_row    = number<br>      widget_line_height = number<br>      widget_line_width  = number<br>    })))<br>    bar_widgets = optional(map(object({<br>      widget_bar_nrql   = string<br>      widget_bar_column = number<br>      widget_bar_row    = number<br>      widget_bar_height = number<br>      widget_bar_width  = number<br>    })))<br>    pie_widgets = optional(map(object({<br>      widget_pie_nrql   = string<br>      widget_pie_column = number<br>      widget_pie_row    = number<br>      widget_pie_height = number<br>      widget_pie_width  = number<br>    })))<br>    table_widgets = optional(map(object({<br>      widget_table_nrql   = string<br>      widget_table_column = number<br>      widget_table_row    = number<br>      widget_table_height = number<br>      widget_table_width  = number<br>    })))<br>  }))</pre> | n/a | yes |
| <a name="input_newrelic_dashboard_permissions"></a> [newrelic\_dashboard\_permissions](#input\_newrelic\_dashboard\_permissions) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->