## Alert Policy Values: ##
newrelic_alert_policy                     = "POLICY_NAME"
newrelic_alert_policy_incident_preference = "INCIDENT_PREFERENCE"
## Notification Channel Values: ##
newrelic_alert_email_channel_name     = "MY_EMAIL_ALERT_CHANNEL_NAME"
newrelic_alert_slack_channel_name     = "MY_SLACK_ALERT_CHANNEL_NAME"
newrelic_alert_pagerduty_channel_name = "MY_PAGERDUTY_ALERT_CHANNEL_NAME"
## Alert Conditions: ##
newrelic_alert_conditions = {
  "ALERT_CONDITION_N" = {
    violation_time_limit_seconds = 2592000
    aggregation_method           = "event_flow"
    aggregation_delay            = 120
    nrql = {
      "query" = {
        query = "SELECT latest(k8s.node.allocatableCpuCoresUtilization) FROM Metric FACET `k8s.nodeName`"
      }
    },
    critical = {
      "critical" = {
        operator              = "above"
        threshold             = 90
        threshold_duration    = 300
        threshold_occurrences = "ALL"
      }
    }
    warning = {
      "warning" = {
        operator              = "above"
        threshold             = 75
        threshold_duration    = 600
        threshold_occurrences = "ALL"
      }
    }
  }
}