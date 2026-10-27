output "workloads_id" {
  description = "Map of id values across all workloads, keyed the same as var.workloads"
  value       = { for k, v in newrelic_workload.workloads : k => v.id }
}
output "workloads_account_id" {
  description = "Map of account_id values across all workloads, keyed the same as var.workloads"
  value       = { for k, v in newrelic_workload.workloads : k => v.account_id }
}
output "workloads_composite_entity_search_query" {
  description = "Map of composite_entity_search_query values across all workloads, keyed the same as var.workloads"
  value       = { for k, v in newrelic_workload.workloads : k => v.composite_entity_search_query }
}
output "workloads_description" {
  description = "Map of description values across all workloads, keyed the same as var.workloads"
  value       = { for k, v in newrelic_workload.workloads : k => v.description }
}
output "workloads_dynamic_flows" {
  description = "Map of dynamic_flows values across all workloads, keyed the same as var.workloads"
  value       = { for k, v in newrelic_workload.workloads : k => v.dynamic_flows }
}
output "workloads_entity_guids" {
  description = "Map of entity_guids values across all workloads, keyed the same as var.workloads"
  value       = { for k, v in newrelic_workload.workloads : k => v.entity_guids }
}
output "workloads_entity_search_query" {
  description = "Map of entity_search_query values across all workloads, keyed the same as var.workloads"
  value       = { for k, v in newrelic_workload.workloads : k => v.entity_search_query }
}
output "workloads_guid" {
  description = "Map of guid values across all workloads, keyed the same as var.workloads"
  value       = { for k, v in newrelic_workload.workloads : k => v.guid }
}
output "workloads_name" {
  description = "Map of name values across all workloads, keyed the same as var.workloads"
  value       = { for k, v in newrelic_workload.workloads : k => v.name }
}
output "workloads_permalink" {
  description = "Map of permalink values across all workloads, keyed the same as var.workloads"
  value       = { for k, v in newrelic_workload.workloads : k => v.permalink }
}
output "workloads_scope_account_ids" {
  description = "Map of scope_account_ids values across all workloads, keyed the same as var.workloads"
  value       = { for k, v in newrelic_workload.workloads : k => v.scope_account_ids }
}
output "workloads_status_config_alert_policy" {
  description = "Map of status_config_alert_policy values across all workloads, keyed the same as var.workloads"
  value       = { for k, v in newrelic_workload.workloads : k => one(v.status_config_alert_policy) }
}
output "workloads_status_config_automatic" {
  description = "Map of status_config_automatic values across all workloads, keyed the same as var.workloads"
  value       = { for k, v in newrelic_workload.workloads : k => one(v.status_config_automatic) }
}
output "workloads_status_config_static" {
  description = "Map of status_config_static values across all workloads, keyed the same as var.workloads"
  value       = { for k, v in newrelic_workload.workloads : k => one(v.status_config_static) }
}
output "workloads_workload_id" {
  description = "Map of workload_id values across all workloads, keyed the same as var.workloads"
  value       = { for k, v in newrelic_workload.workloads : k => v.workload_id }
}

