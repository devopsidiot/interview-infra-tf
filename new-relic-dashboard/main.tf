terraform {
  experiments = [module_variable_optional_attrs]

  required_providers {
    newrelic = { source = "newrelic/newrelic" }
  }
}

resource "newrelic_one_dashboard" "devopsidiot_dashboard" {
  name        = var.newrelic_dashboard_name
  permissions = var.newrelic_dashboard_permissions
  dynamic "page" {
    for_each = var.newrelic_dashboard_pages
    content {
      name = page.key
      dynamic "widget_line" {
        for_each = page.value["line_widgets"] != null ? page.value["line_widgets"] : {}
        content {
          column = widget_line.value.widget_line_column
          height = widget_line.value.widget_line_height
          row    = widget_line.value.widget_line_row
          width  = widget_line.value.widget_line_width
          title  = widget_line.key
          nrql_query {
            query = widget_line.value.widget_line_nrql
          }
        }
      }
      dynamic "widget_bar" {
        for_each = page.value["bar_widgets"] != null ? page.value["bar_widgets"] : {}
        content {
          column = widget_bar.value.widget_bar_column
          height = widget_bar.value.widget_bar_height
          row    = widget_bar.value.widget_bar_row
          width  = widget_bar.value.widget_bar_width
          title  = widget_bar.key
          nrql_query {
            query = widget_bar.value.widget_bar_nrql
          }
        }
      }
      dynamic "widget_pie" {
        for_each = page.value["pie_widgets"] != null ? page.value["pie_widgets"] : {}
        content {
          column = widget_pie.value.widget_pie_column
          height = widget_pie.value.widget_pie_height
          row    = widget_pie.value.widget_pie_row
          width  = widget_pie.value.widget_pie_width
          title  = widget_pie.key
          nrql_query {
            query = widget_pie.value.widget_pie_nrql
          }
        }
      }
      dynamic "widget_table" {
        for_each = page.value["table_widgets"] != null ? page.value["table_widgets"] : {}
        content {
          column = widget_table.value.widget_table_column
          height = widget_table.value.widget_table_height
          row    = widget_table.value.widget_table_row
          width  = widget_table.value.widget_table_width
          title  = widget_table.key
          nrql_query {
            query = widget_table.value.widget_table_nrql
          }
        }
      }
    }
  }
}
