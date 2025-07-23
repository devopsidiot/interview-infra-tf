variable "newrelic_dashboard_name" { type = string }
variable "newrelic_dashboard_permissions" { type = string }
variable "newrelic_dashboard_pages" {
  description = "My Dashboard"
  type = map(object({
    line_widgets = optional(map(object({
      widget_line_nrql   = string
      widget_line_column = number
      widget_line_row    = number
      widget_line_height = number
      widget_line_width  = number
    })))
    bar_widgets = optional(map(object({
      widget_bar_nrql   = string
      widget_bar_column = number
      widget_bar_row    = number
      widget_bar_height = number
      widget_bar_width  = number
    })))
    pie_widgets = optional(map(object({
      widget_pie_nrql   = string
      widget_pie_column = number
      widget_pie_row    = number
      widget_pie_height = number
      widget_pie_width  = number
    })))
    table_widgets = optional(map(object({
      widget_table_nrql   = string
      widget_table_column = number
      widget_table_row    = number
      widget_table_height = number
      widget_table_width  = number
    })))
  }))
}
