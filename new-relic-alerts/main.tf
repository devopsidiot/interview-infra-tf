terraform {
  experiments = [module_variable_optional_attrs]
  required_providers {
    newrelic = { source = "newrelic/newrelic" }
  }
}
data "newrelic_alert_channel" "email" {
  count = var.newrelic_alert_email_channel_name != "" ? 1 : 0
  name  = var.newrelic_alert_email_channel_name
}

data "newrelic_alert_channel" "slack" {
  count = var.newrelic_alert_slack_channel_name != "" ? 1 : 0
  name  = var.newrelic_alert_slack_channel_name
}

data "newrelic_alert_channel" "pagerduty" {
  count = var.newrelic_alert_pagerduty_channel_name != "" ? 1 : 0
  name  = var.newrelic_alert_pagerduty_channel_name
}

resource "newrelic_alert_policy" "devopsidiot_policy" {
  name                = var.newrelic_alert_policy
  incident_preference = var.newrelic_alert_policy_incident_preference
  channel_ids = flatten([
    [var.newrelic_alert_email_channel_name != "" ? [data.newrelic_alert_channel.email[0].id] : []],
    [var.newrelic_alert_pagerduty_channel_name != "" ? [data.newrelic_alert_channel.pagerduty[0].id] : []],
    [var.newrelic_alert_slack_channel_name != "" ? [data.newrelic_alert_channel.slack[0].id] : []]
  ])
}

resource "newrelic_nrql_alert_condition" "devopsidiot_alert" {
  for_each                       = var.newrelic_alert_conditions != null ? var.newrelic_alert_conditions : {}
  name                           = each.key
  type                           = each.value.type == null ? "static" : "baseline"
  baseline_direction             = each.value.baseline_direction != null ? each.value.baseline_direction : null
  policy_id                      = newrelic_alert_policy.devopsidiot_policy.id
  enabled                        = true
  violation_time_limit_seconds   = each.value.violation_time_limit_seconds
  value_function                 = each.value.type == null ? "single_value" : null
  slide_by                       = each.value.slide_by != null ? each.value.slide_by : null
  expiration_duration            = each.value.expiration_duration
  close_violations_on_expiration = each.value.close_violations_on_expiration
  aggregation_method             = each.value.aggregation_method
  aggregation_delay              = each.value.aggregation_delay
  aggregation_timer              = each.value.aggregation_timer
  aggregation_window             = each.value.aggregation_window == null ? 60 : each.value.aggregation_window
  dynamic "nrql" {
    for_each = each.value["nrql"]
    content {
      query             = nrql.value.query
      evaluation_offset = nrql.value.evaluation_offset
    }
  }
  dynamic "warning" {
    for_each = each.value["warning"] != null ? each.value["warning"] : {}
    content {
      operator              = warning.value.operator
      threshold             = warning.value.threshold
      threshold_duration    = warning.value.threshold_duration
      threshold_occurrences = warning.value.threshold_occurrences
    }
  }
  dynamic "critical" {
    for_each = each.value["critical"] != null ? each.value["critical"] : {}
    content {
      operator              = critical.value.operator
      threshold             = critical.value.threshold
      threshold_duration    = critical.value.threshold_duration
      threshold_occurrences = critical.value.threshold_occurrences
    }
  }
}
