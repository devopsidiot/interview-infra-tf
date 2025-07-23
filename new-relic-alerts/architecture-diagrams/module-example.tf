module "glorify_new_relic_alerts" {
  source = "git@github.com:devopsidiot/interview-infra-tf.git//new-relic-alerts"
  ## Alert Policy Values: ##
  newrelic_alert_policy                     = "prod-eks"
  newrelic_alert_policy_incident_preference = "PER_CONDITION"
  ## Notification Channel Values: ##
  newrelic_alert_slack_channel_name = "devops-alerts"
  ## Alert Conditions: ##
  newrelic_alert_conditions = {
    "Node CPU Usage Percentage" = {
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
    },
    "Node Memory Usage Percentage" = {
      violation_time_limit_seconds = 2592000
      aggregation_method           = "event_flow"
      aggregation_delay            = 120
      nrql = {
        "query" = {
          query = "SELECT latest(allocatableMemoryUtilization) FROM K8sNodeSample FACET `nodeName` EXTRAPOLATE"
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
    },
    "Node Ready" = {
      violation_time_limit_seconds = 2592000
      aggregation_method           = "event_flow"
      aggregation_delay            = 120
      nrql = {
        "query" = {
          query = "SELECT latest(`condition.Ready`) FROM K8sNodeSample FACET nodeName"
        }
      },
      critical = {
        "critical" = {
          operator              = "below"
          threshold             = 1
          threshold_duration    = 600
          threshold_occurrences = "ALL"
        }
      }
      warning = {
        "warning" = {
          operator              = "below"
          threshold             = 1
          threshold_duration    = 300
          threshold_occurrences = "ALL"
        }
      }
    },
    "Node Storage Usage Percentage" = {
      violation_time_limit_seconds = 2592000
      aggregation_method           = "event_flow"
      aggregation_delay            = 120
      nrql = {
        "query" = {
          query = "SELECT latest(fsCapacityUtilization) FROM K8sNodeSample FACET `nodeName` EXTRAPOLATE"
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
    },
    "Node MemoryPressure" = {
      violation_time_limit_seconds = 2592000
      aggregation_method           = "event_flow"
      aggregation_delay            = 120
      nrql = {
        "query" = {
          query = "SELECT latest(`condition.MemoryPressure`) FROM K8sNodeSample FACET nodeName"
        }
      },
      critical = {
        "critical" = {
          operator              = "above"
          threshold             = 0
          threshold_duration    = 600
          threshold_occurrences = "ALL"
        }
      }
      warning = {
        "warning" = {
          operator              = "above"
          threshold             = 0
          threshold_duration    = 300
          threshold_occurrences = "ALL"
        }
      }
    },
    "Node PIDPressure" = {
      violation_time_limit_seconds = 2592000
      aggregation_method           = "event_flow"
      aggregation_delay            = 120
      nrql = {
        "query" = {
          query = "SELECT latest(`condition.PIDPressure`) FROM K8sNodeSample FACET nodeName"
        }
      },
      critical = {
        "critical" = {
          operator              = "above"
          threshold             = 0
          threshold_duration    = 600
          threshold_occurrences = "ALL"
        }
      }
      warning = {
        "warning" = {
          operator              = "above"
          threshold             = 0
          threshold_duration    = 300
          threshold_occurrences = "ALL"
        }
      }
    },
    "Node DiskPressure" = {
      violation_time_limit_seconds = 2592000
      aggregation_method           = "event_flow"
      aggregation_delay            = 120
      nrql = {
        "query" = {
          query = "SELECT latest(`condition.DiskPressure`) FROM K8sNodeSample FACET nodeName"
        }
      },
      critical = {
        "critical" = {
          operator              = "above"
          threshold             = 0
          threshold_duration    = 600
          threshold_occurrences = "ALL"
        }
      }
      warning = {
        "warning" = {
          operator              = "above"
          threshold             = 0
          threshold_duration    = 300
          threshold_occurrences = "ALL"
        }
      }
    },
    "Unscheduable Nodes" = {
      violation_time_limit_seconds = 2592000
      aggregation_method           = "event_flow"
      aggregation_delay            = 120
      nrql = {
        "query" = {
          query = "SELECT latest(unschedulable) FROM K8sNodeSample FACET nodeName"
        }
      },
      critical = {
        "critical" = {
          operator              = "above"
          threshold             = 0
          threshold_duration    = 600
          threshold_occurrences = "ALL"
        }
      }
      warning = {
        "warning" = {
          operator              = "above"
          threshold             = 0
          threshold_duration    = 300
          threshold_occurrences = "ALL"
        }
      }
    },
    "Pod Count" = {
      violation_time_limit_seconds = 2592000
      aggregation_method           = "event_flow"
      aggregation_delay            = 120
      nrql = {
        "query" = {
          query = "SELECT latest(podsUnavailable)  FROM K8sDeploymentSample FACET `deploymentName` EXTRAPOLATE"
        }
      },
      critical = {
        "critical" = {
          operator              = "above"
          threshold             = 0
          threshold_duration    = 600
          threshold_occurrences = "ALL"
        }
      }
      warning = {
        "warning" = {
          operator              = "above"
          threshold             = 0
          threshold_duration    = 300
          threshold_occurrences = "ALL"
        }
      }
    },
    "Container Restart Count" = {
      violation_time_limit_seconds = 2592000
      aggregation_method           = "event_flow"
      aggregation_delay            = 120
      nrql = {
        "query" = {
          query = "SELECT latest(restartCount) FROM K8sContainerSample FACET `containerName` EXTRAPOLATE"
        }
      },
      critical = {
        "critical" = {
          operator              = "above"
          threshold             = 0
          threshold_duration    = 600
          threshold_occurrences = "ALL"
        }
      }
      warning = {
        "warning" = {
          operator              = "above"
          threshold             = 0
          threshold_duration    = 300
          threshold_occurrences = "ALL"
        }
      }
    },
    "Container CPU Usage" = {
      violation_time_limit_seconds = 2592000
      aggregation_method           = "event_flow"
      aggregation_delay            = 120
      nrql = {
        "query" = {
          query = "SELECT latest(cpuCoresUtilization) FROM K8sContainerSample FACET `containerName` EXTRAPOLATE"
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
    },
    "Container Memory Usage" = {
      violation_time_limit_seconds = 2592000
      aggregation_method           = "event_flow"
      aggregation_delay            = 120
      nrql = {
        "query" = {
          query = "SELECT latest(memoryWorkingSetUtilization) FROM K8sContainerSample FACET `containerName` EXTRAPOLATE"
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
    },
  }
}
