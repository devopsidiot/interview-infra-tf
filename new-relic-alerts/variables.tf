variable "newrelic_alert_conditions" {
  type = map(object({
    aggregation_method             = optional(string),
    aggregation_delay              = optional(number),
    aggregation_timer              = optional(number),
    aggregation_window             = optional(number),
    close_violations_on_expiration = optional(bool),
    expiration_duration            = optional(number),
    type                           = optional(string),
    baseline_direction             = optional(string),
    slide_by                       = optional(number),
    violation_time_limit_seconds   = number,
    nrql = map(object({
      query             = string,
      evaluation_offset = optional(number)
    })),
    critical = optional(map(object({
      operator              = string,
      threshold             = number,
      threshold_duration    = number,
      threshold_occurrences = string
    }))),
    warning = optional(map(object({
      operator              = string,
      threshold             = number,
      threshold_duration    = number,
      threshold_occurrences = string
    })))
  }))
}
variable "newrelic_alert_policy" { type = string }
variable "newrelic_alert_policy_incident_preference" { type = string }

variable "newrelic_alert_email_channel_name" {
  type    = string
  default = ""
}
variable "newrelic_alert_pagerduty_channel_name" {
  type    = string
  default = ""
}
variable "newrelic_alert_slack_channel_name" {
  type    = string
  default = ""
}