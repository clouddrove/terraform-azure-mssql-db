## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| admin\_password | The password associated with the admin\_username user | `string` | `null` | no |
| admin\_username | The administrator login name for the new SQL Server | `string` | `null` | no |
| collation | n/a | `string` | `"SQL_Latin1_General_CP1_CI_AS"` | no |
| create\_resource\_group | Whether to create resource group and use it for all networking resources | `bool` | `true` | no |
| create\_storage\_account | Make it true to create storage account for the audit policies. | `bool` | `false` | no |
| database\_name | The name of the database | `string` | `""` | no |
| db\_sku\_name | n/a | `string` | `null` | no |
| disabled\_alerts | Specifies an array of alerts that are disabled. Allowed values are: Sql\_Injection, Sql\_Injection\_Vulnerability, Access\_Anomaly, Data\_Exfiltration, Unsafe\_Action. | `list(any)` | `[]` | no |
| email\_addresses\_for\_alerts | A list of email addresses which alerts should be sent to. | `list(any)` | `[]` | no |
| enable\_database\_extended\_auditing\_policy | Manages Extended Audit policy for SQL database | `bool` | `false` | no |
| enable\_databases\_extended\_auditing\_policy | Whether to enable the extended auditing policy. Possible values are true and false. Defaults to true. | `bool` | `true` | no |
| enable\_diagnostic | Set to false to prevent the module from creating any resources. | `bool` | `false` | no |
| enable\_extended\_auditing\_policy | Whether to enable the extended auditing policy. Possible values are true and false. Defaults to true. | `bool` | `true` | no |
| enable\_failover\_group | Create a failover group of databases on a collection of Azure SQL servers | `bool` | `false` | no |
| enable\_firewall\_rules | Manage an Azure SQL Firewall Rule | `bool` | `false` | no |
| enable\_log\_monitoring | Enable audit events to Azure Monitor? | `bool` | `false` | no |
| enable\_private\_endpoint | Manages a Private Endpoint to SQL database | `bool` | `false` | no |
| enable\_readonly\_failover\_policy | n/a | `bool` | `true` | no |
| enable\_sql\_server\_extended\_auditing\_policy | Manages Extended Audit policy for SQL servers | `bool` | `false` | no |
| enable\_threat\_detection\_policy | n/a | `bool` | `false` | no |
| enable\_vulnerability\_assessment | Manages the Vulnerability Assessment for a MS SQL Server | `bool` | `false` | no |
| enabled | Set to false to prevent the module from creating any resources. | `bool` | `true` | no |
| enclave\_type | n/a | `string` | `"VBS"` | no |
| endpoint\_name | Custom Name for the Private Endpoint | `string` | `""` | no |
| environment | Project environment | `string` | `""` | no |
| eventhub\_authorization\_rule\_id | Eventhub authorization rule id to pass it to destination details of diagnosys setting of NSG. | `string` | `null` | no |
| eventhub\_name | Eventhub Name to pass it to destination details of diagnosys setting of NSG. | `string` | `null` | no |
| existing\_private\_dns\_zone | Name of the existing private DNS zone | `string` | `null` | no |
| existing\_subnet\_id | The resource id of existing subnet | `string` | `null` | no |
| existing\_vnet\_id | The resoruce id of existing Virtual network | `string` | `null` | no |
| firewall\_rules | Range of IP addresses to allow firewall connections. | <pre>list(object({<br>    name             = string<br>    start_ip_address = string<br>    end_ip_address   = string<br>  }))</pre> | `[]` | no |
| identity | If you want your SQL Server to have an managed identity. Defaults to false. | `bool` | `false` | no |
| initialize\_sql\_script\_execution | Allow/deny to Create and initialize a Microsoft SQL Server database | `bool` | `false` | no |
| label\_order | Label order, e.g. sequence of application name and environment `name`,`environment`,'attribute' [`webserver`,`qa`,`devops`,`public`,] . | `list(any)` | <pre>[<br>  "name",<br>  "environment"<br>]</pre> | no |
| license\_type | n/a | `string` | `"LicenseIncluded"` | no |
| location | The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table' | `string` | `""` | no |
| log\_analytics\_destination\_type | Possible values are AzureDiagnostics and Dedicated, default to AzureDiagnostics. When set to Dedicated, logs sent to a Log Analytics workspace will go into resource specific tables, instead of the legacy AzureDiagnostics table. | `string` | `"AzureDiagnostics"` | no |
| log\_analytics\_workspace\_id | Specifies the ID of a Log Analytics Workspace where Diagnostics Data to be sent | `string` | `null` | no |
| log\_category | Categories of logs to be recorded in diagnostic setting for MSSQL database. Acceptable values are SQLSecurityAuditEvents, SQLInsights, AutomaticTuning, or QueryStoreRuntimeStatistics. | `list(string)` | <pre>[<br>  "SQLSecurityAuditEvents",<br>  "SQLInsights"<br>]</pre> | no |
| log\_retention\_days | Specifies the number of days to keep in the Threat Detection audit logs | `string` | `"30"` | no |
| managedby | ManagedBy, eg ''. | `string` | `""` | no |
| max\_size\_gb | n/a | `number` | `2` | no |
| metric\_enabled | Whether metric diagnonsis should be enable in diagnostic settings for flexible Mysql. | `bool` | `true` | no |
| minimum\_tls\_version | The Minimum TLS Version for all SQL Database and SQL Data Warehouse databases associated with the server. Valid values are: 1.0, 1.1 , 1.2 and Disabled. Defaults to 1.2. | `string` | `"1.2"` | no |
| name | Name  (e.g. `app` or `cluster`). | `string` | `""` | no |
| random\_password\_length | The desired length of random password created by this module | `number` | `32` | no |
| repository | Terraform current module repo | `string` | `""` | no |
| resource\_group\_name | A container that holds related resources for an Azure solution | `string` | `""` | no |
| secondary\_sql\_server\_location | Specifies the supported Azure location to create secondary sql server resource | `string` | `"northeurope"` | no |
| sql\_server\_version | The version for the new server. Valid values are: 2.0 (for v11 server) and 12.0 (for v12 server) | `string` | `null` | no |
| sqldb\_init\_script\_file | SQL Script file name to create and initialize the database | `string` | `""` | no |
| sqlserver\_name | SQL server Name | `string` | `""` | no |
| storage\_account\_access\_key | The primary access key for the storage account. | `string` | `null` | no |
| storage\_account\_blob\_endpoint | The endpoint URL for blob storage in the primary location. | `string` | `null` | no |
| storage\_account\_id | The name of the storage account to store the all monitoring logs | `string` | `null` | no |
| storage\_account\_name | The name of the storage account name | `string` | `null` | no |
| tags | A map of tags to add to all resources | `map(string)` | `{}` | no |
| threat\_detection\_audit\_logs\_retention\_days | Specifies the number of days to keep in the Threat Detection audit logs. | `number` | `0` | no |
| virtual\_network\_name | The name of the virtual network | `string` | `""` | no |
| vnet\_link\_name | Custom Name for the Private Endpoint | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| primary\_sql\_server\_fqdn | The fully qualified domain name of the primary Azure SQL Server |
| primary\_sql\_server\_id | The primary Microsoft SQL Server ID |
| primary\_sql\_server\_private\_endpoint | id of the Primary SQL server Private Endpoint |
| primary\_sql\_server\_private\_endpoint\_fqdn | Priamary SQL server private endpoint IPv4 Addresses |
| primary\_sql\_server\_private\_endpoint\_ip | Priamary SQL server private endpoint IPv4 Addresses |
| resource\_group\_location | The location of the resource group in which resources are created |
| resource\_group\_name | The name of the resource group in which resources are created |
| secondary\_sql\_server\_fqdn | The fully qualified domain name of the secondary Azure SQL Server |
| secondary\_sql\_server\_id | The secondary Microsoft SQL Server ID |
| secondary\_sql\_server\_private\_endpoint | id of the Primary SQL server Private Endpoint |
| secondary\_sql\_server\_private\_endpoint\_fqdn | Secondary SQL server private endpoint IPv4 Addresses |
| secondary\_sql\_server\_private\_endpoint\_ip | Secondary SQL server private endpoint IPv4 Addresses |
| sql\_database\_id | The SQL Database ID |
| sql\_database\_name | The SQL Database Name |
| sql\_failover\_group\_id | A failover group of databases on a collection of Azure SQL servers. |
| sql\_server\_admin\_password | SQL database administrator login password |
| sql\_server\_admin\_user | SQL database administrator login id |
| sql\_server\_private\_dns\_zone\_domain | DNS zone name of SQL server Private endpoints dns name records |
| storage\_account\_id | The ID of the storage account |
| storage\_account\_name | The name of the storage account |

