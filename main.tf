resource "newrelic_workload" "workloads" {
  for_each = var.workloads

  name              = each.value.name
  account_id        = each.value.account_id
  description       = each.value.description
  entity_guids      = each.value.entity_guids
  scope_account_ids = each.value.scope_account_ids

  dynamic "dynamic_flows" {
    for_each = each.value.dynamic_flows != null ? each.value.dynamic_flows : []
    content {
      entity_guid      = dynamic_flows.value.entity_guid
      transaction_name = dynamic_flows.value.transaction_name
    }
  }

  dynamic "entity_search_query" {
    for_each = each.value.entity_search_query != null ? each.value.entity_search_query : []
    content {
      query = entity_search_query.value.query
    }
  }

  dynamic "status_config_alert_policy" {
    for_each = each.value.status_config_alert_policy != null ? [each.value.status_config_alert_policy] : []
    content {
      enabled = status_config_alert_policy.value.enabled
    }
  }

  dynamic "status_config_automatic" {
    for_each = each.value.status_config_automatic != null ? [each.value.status_config_automatic] : []
    content {
      enabled = status_config_automatic.value.enabled
      dynamic "remaining_entities_rule" {
        for_each = status_config_automatic.value.remaining_entities_rule != null ? [status_config_automatic.value.remaining_entities_rule] : []
        content {
          remaining_entities_rule_rollup {
            group_by        = remaining_entities_rule.value.remaining_entities_rule_rollup.group_by
            strategy        = remaining_entities_rule.value.remaining_entities_rule_rollup.strategy
            threshold_type  = remaining_entities_rule.value.remaining_entities_rule_rollup.threshold_type
            threshold_value = remaining_entities_rule.value.remaining_entities_rule_rollup.threshold_value
          }
        }
      }
      dynamic "rule" {
        for_each = status_config_automatic.value.rule != null ? status_config_automatic.value.rule : []
        content {
          entity_guids = rule.value.entity_guids
          dynamic "nrql_query" {
            for_each = rule.value.nrql_query != null ? rule.value.nrql_query : []
            content {
              query = nrql_query.value.query
            }
          }
          rollup {
            strategy        = rule.value.rollup.strategy
            threshold_type  = rule.value.rollup.threshold_type
            threshold_value = rule.value.rollup.threshold_value
          }
        }
      }
    }
  }

  dynamic "status_config_static" {
    for_each = each.value.status_config_static != null ? [each.value.status_config_static] : []
    content {
      description = status_config_static.value.description
      enabled     = status_config_static.value.enabled
      status      = status_config_static.value.status
      summary     = status_config_static.value.summary
    }
  }
}

