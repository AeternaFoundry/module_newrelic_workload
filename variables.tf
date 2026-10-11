variable "workloads" {
  description = <<EOT
Map of workloads, attributes below
Required:
    - name
Optional:
    - account_id
    - description
    - entity_guids
    - scope_account_ids
    - dynamic_flows (block):
        - entity_guid (required)
        - transaction_name (required)
    - entity_search_query (block):
        - query (required)
    - status_config_alert_policy (block):
        - enabled (required)
    - status_config_automatic (block):
        - enabled (required)
        - remaining_entities_rule (optional, block):
            - remaining_entities_rule_rollup (required, block):
                - group_by (required)
                - strategy (required)
                - threshold_type (optional)
                - threshold_value (optional)
        - rule (optional, block):
            - entity_guids (optional)
            - nrql_query (optional, block):
                - query (required)
            - rollup (required, block):
                - strategy (required)
                - threshold_type (optional)
                - threshold_value (optional)
    - status_config_static (block):
        - description (optional)
        - enabled (required)
        - status (required)
        - summary (optional)
EOT

  type = map(object({
    name              = string
    account_id        = optional(number)
    description       = optional(string)
    entity_guids      = optional(set(string))
    scope_account_ids = optional(set(number))
    dynamic_flows = optional(list(object({
      entity_guid      = string
      transaction_name = string
    })))
    entity_search_query = optional(list(object({
      query = string
    })))
    status_config_alert_policy = optional(object({
      enabled = bool
    }))
    status_config_automatic = optional(object({
      enabled = bool
      remaining_entities_rule = optional(object({
        remaining_entities_rule_rollup = object({
          group_by        = string
          strategy        = string
          threshold_type  = optional(string)
          threshold_value = optional(number)
        })
      }))
      rule = optional(list(object({
        entity_guids = optional(set(string))
        nrql_query = optional(list(object({
          query = string
        })))
        rollup = object({
          strategy        = string
          threshold_type  = optional(string)
          threshold_value = optional(number)
        })
      })))
    }))
    status_config_static = optional(object({
      description = optional(string)
      enabled     = bool
      status      = string
      summary     = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.workloads : (
        v.entity_search_query == null || alltrue([for item in v.entity_search_query : ((length(item.query) > 0) && (length(trimspace(item.query)) > 0))])
      )
    ])
    error_message = "all of: must not be empty; must not be empty or only whitespace (1 further check(s) enforced by the provider, not mirrored here)"
  }
  validation {
    condition = alltrue([
      for k, v in var.workloads : (
        v.status_config_automatic == null || (v.status_config_automatic.rule == null || alltrue([for item in v.status_config_automatic.rule : (item.nrql_query == null || alltrue([for item in item.nrql_query : ((length(item.query) > 0) && (length(trimspace(item.query)) > 0))]))]))
      )
    ])
    error_message = "all of: must not be empty; must not be empty or only whitespace (1 further check(s) enforced by the provider, not mirrored here)"
  }
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

