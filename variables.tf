variable "create_resource_group" {
  description = "Whether to create resource group and use it for all networking resources"
  type        = bool
  default     = true
}

variable "resource_group_name" {
  description = "A container that holds related resources for an Azure solution"
  default     = ""
  type        = string
}

variable "storage_account_name" {
  description = "The name of the storage account name"
  default     = null
  type        = string
}

variable "location" {
  description = "The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
  default     = ""
  type        = string
}

variable "random_password_length" {
  description = "The desired length of random password created by this module"
  default     = 32
  type        = number
}

variable "enable_sql_server_extended_auditing_policy" {
  type        = bool
  description = "Manages Extended Audit policy for SQL servers"
  default     = false
}

variable "enable_database_extended_auditing_policy" {
  type        = bool
  description = "Manages Extended Audit policy for SQL database"
  default     = false
}

variable "enable_threat_detection_policy" {
  description = ""
  default     = false
  type        = bool
}

variable "sqlserver_name" {
  description = "SQL server Name"
  default     = ""
  type        = string
}

variable "admin_username" {
  description = "The administrator login name for the new SQL Server"
  default     = null
  type        = string
}

variable "admin_password" {
  description = "The password associated with the admin_username user"
  default     = null
  type        = string
}

variable "database_name" {
  description = "The name of the database"
  default     = ""
  type        = string
}

variable "sql_database_edition" {
  description = "The edition of the database to be created"
  default     = "Standard"
  type        = string
}

variable "sqldb_service_objective_name" {
  description = " The service objective name for the database"
  default     = "S1"
  type        = string
}

variable "log_retention_days" {
  description = "Specifies the number of days to keep in the Threat Detection audit logs"
  default     = "30"
  type        = string
}

variable "threat_detection_audit_logs_retention_days" {
  description = "Specifies the number of days to keep in the Threat Detection audit logs."
  default     = 0
  type        = number
}

variable "enable_vulnerability_assessment" {
  type        = bool
  description = "Manages the Vulnerability Assessment for a MS SQL Server"
  default     = false
}

variable "email_addresses_for_alerts" {
  description = "A list of email addresses which alerts should be sent to."
  type        = list(any)
  default     = []
}

variable "disabled_alerts" {
  description = "Specifies an array of alerts that are disabled. Allowed values are: Sql_Injection, Sql_Injection_Vulnerability, Access_Anomaly, Data_Exfiltration, Unsafe_Action."
  type        = list(any)
  default     = []
}

variable "ad_admin_login_name" {
  description = "The login name of the principal to set as the server administrator"
  default     = null
  type        = string
}

variable "identity" {
  description = "If you want your SQL Server to have an managed identity. Defaults to false."
  default     = false
  type        = bool
}

variable "enable_firewall_rules" {
  description = "Manage an Azure SQL Firewall Rule"
  default     = false
  type        = bool
}

variable "enable_failover_group" {
  description = "Create a failover group of databases on a collection of Azure SQL servers"
  default     = false
  type        = bool
}

variable "secondary_sql_server_location" {
  description = "Specifies the supported Azure location to create secondary sql server resource"
  default     = "northeurope"
  type        = string
}

variable "enable_private_endpoint" {
  description = "Manages a Private Endpoint to SQL database"
  default     = false
  type        = bool
}

variable "virtual_network_name" {
  type        = string
  description = "The name of the virtual network"
  default     = ""
}

variable "private_subnet_address_prefix" {
  description = "The name of the subnet for private endpoints"
  default     = null
  type        = string
}

variable "existing_vnet_id" {
  description = "The resoruce id of existing Virtual network"
  default     = null
  type        = string
}

variable "existing_subnet_id" {
  description = "The resource id of existing subnet"
  default     = null
  type        = string
}

variable "existing_private_dns_zone" {
  description = "Name of the existing private DNS zone"
  default     = null
  type        = string
}

variable "firewall_rules" {
  description = "Range of IP addresses to allow firewall connections."
  type = list(object({
    name             = string
    start_ip_address = string
    end_ip_address   = string
  }))
  default = []
}

variable "enable_log_monitoring" {
  type        = bool
  description = "Enable audit events to Azure Monitor?"
  default     = false
}

variable "initialize_sql_script_execution" {
  description = "Allow/deny to Create and initialize a Microsoft SQL Server database"
  default     = false
  type        = bool
}

variable "sqldb_init_script_file" {
  type        = string
  description = "SQL Script file name to create and initialize the database"
  default     = ""
}

variable "log_analytics_workspace_id" {
  description = "Specifies the ID of a Log Analytics Workspace where Diagnostics Data to be sent"
  default     = null
  type        = string
}

variable "storage_account_id" {
  description = "The name of the storage account to store the all monitoring logs"
  default     = null
  type        = string
}

variable "extaudit_diag_logs" {
  description = "Database Monitoring Category details for Azure Diagnostic setting"
  default     = ["SQLSecurityAuditEvents", "SQLInsights", "AutomaticTuning", "QueryStoreRuntimeStatistics", "QueryStoreWaitStatistics", "Errors", "DatabaseWaitStatistics", "Timeouts", "Blocks", "Deadlocks"]
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

#lable
variable "repository" {
  type        = string
  default     = ""
  description = "Terraform current module repo"
}

variable "label_order" {
  type        = list(any)
  default     = []
  description = "Label order, e.g. sequence of application name and environment `name`,`environment`,'attribute' [`webserver`,`qa`,`devops`,`public`,] ."
}

variable "managedby" {
  type        = string
  default     = ""
  description = "ManagedBy, eg ''."
}

variable "name" {
  type        = string
  default     = ""
  description = "Name  (e.g. `app` or `cluster`)."
}

variable "environment" {
  type        = string
  default     = ""
  description = "Project environment"

}

variable "sql_server_version" {
  type        = string
  default     = null
  description = "The version for the new server. Valid values are: 2.0 (for v11 server) and 12.0 (for v12 server)"
}
