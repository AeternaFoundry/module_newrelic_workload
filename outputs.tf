output "workloads_id" {
  description = "Map of id values across all workloads, keyed the same as var.workloads except keys with no id are omitted"
  value       = { for k, v in newrelic_workload.workloads : k => v.id if v.id != null && length(v.id) > 0 }
}
output "workloads_account_id" {
  description = "Map of account_id values across all workloads, keyed the same as var.workloads except keys with no account_id are omitted"
  value       = { for k, v in newrelic_workload.workloads : k => v.account_id if v.account_id != null }
}
output "workloads_composite_entity_search_query" {
  description = "Map of composite_entity_search_query values across all workloads, keyed the same as var.workloads except keys with no composite_entity_search_query are omitted"
  value       = { for k, v in newrelic_workload.workloads : k => v.composite_entity_search_query if v.composite_entity_search_query != null && length(v.composite_entity_search_query) > 0 }
}
output "workloads_description" {
  description = "Map of description values across all workloads, keyed the same as var.workloads except keys with no description are omitted"
  value       = { for k, v in newrelic_workload.workloads : k => v.description if v.description != null && length(v.description) > 0 }
}
output "workloads_dynamic_flows" {
  description = "Map of dynamic_flows values across all workloads, keyed the same as var.workloads except keys with no dynamic_flows are omitted"
  value       = { for k, v in newrelic_workload.workloads : k => v.dynamic_flows if v.dynamic_flows != null && length(v.dynamic_flows) > 0 }
}
output "workloads_entity_guids" {
  description = "Map of entity_guids values across all workloads, keyed the same as var.workloads except keys with no entity_guids are omitted"
  value       = { for k, v in newrelic_workload.workloads : k => v.entity_guids if v.entity_guids != null && length(v.entity_guids) > 0 }
}
output "workloads_entity_search_query" {
  description = "Map of entity_search_query values across all workloads, keyed the same as var.workloads except keys with no entity_search_query are omitted"
  value       = { for k, v in newrelic_workload.workloads : k => v.entity_search_query if v.entity_search_query != null && length(v.entity_search_query) > 0 }
}
output "workloads_guid" {
  description = "Map of guid values across all workloads, keyed the same as var.workloads except keys with no guid are omitted"
  value       = { for k, v in newrelic_workload.workloads : k => v.guid if v.guid != null && length(v.guid) > 0 }
}
output "workloads_name" {
  description = "Map of name values across all workloads, keyed the same as var.workloads except keys with no name are omitted"
  value       = { for k, v in newrelic_workload.workloads : k => v.name if v.name != null && length(v.name) > 0 }
}
output "workloads_permalink" {
  description = "Map of permalink values across all workloads, keyed the same as var.workloads except keys with no permalink are omitted"
  value       = { for k, v in newrelic_workload.workloads : k => v.permalink if v.permalink != null && length(v.permalink) > 0 }
}
output "workloads_scope_account_ids" {
  description = "Map of scope_account_ids values across all workloads, keyed the same as var.workloads except keys with no scope_account_ids are omitted"
  value       = { for k, v in newrelic_workload.workloads : k => v.scope_account_ids if v.scope_account_ids != null && length(v.scope_account_ids) > 0 }
}
output "workloads_status_config_alert_policy" {
  description = "Map of status_config_alert_policy values across all workloads, keyed the same as var.workloads except keys with no status_config_alert_policy are omitted"
  value       = { for k, v in newrelic_workload.workloads : k => one(v.status_config_alert_policy) if v.status_config_alert_policy != null && length(v.status_config_alert_policy) > 0 }
}
output "workloads_status_config_automatic" {
  description = "Map of status_config_automatic values across all workloads, keyed the same as var.workloads except keys with no status_config_automatic are omitted"
  value       = { for k, v in newrelic_workload.workloads : k => one(v.status_config_automatic) if v.status_config_automatic != null && length(v.status_config_automatic) > 0 }
}
output "workloads_status_config_static" {
  description = "Map of status_config_static values across all workloads, keyed the same as var.workloads except keys with no status_config_static are omitted"
  value       = { for k, v in newrelic_workload.workloads : k => one(v.status_config_static) if v.status_config_static != null && length(v.status_config_static) > 0 }
}
output "workloads_workload_id" {
  description = "Map of workload_id values across all workloads, keyed the same as var.workloads except keys with no workload_id are omitted"
  value       = { for k, v in newrelic_workload.workloads : k => v.workload_id if v.workload_id != null }
}

