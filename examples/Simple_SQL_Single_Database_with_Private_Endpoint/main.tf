provider "azurerm" {
  features {}
  subscription_id = "01111111111110-11-11-11-11"
}
##----------------------------------------------------------------------------- 
## Resource Group
##-----------------------------------------------------------------------------
module "resource_group" {
  source  = "clouddrove/resource-group/azure"
  version = "1.0.2"

  name        = "app"
  environment = "test"
  label_order = ["name", "environment"]
  location    = "Canada Central"
}

##----------------------------------------------------------------------------- 
## Vnet
##-----------------------------------------------------------------------------
module "vnet" {
  source              = "clouddrove/vnet/azure"
  version             = "1.0.4"
  name                = "app"
  environment         = "test"
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
  address_spaces      = ["10.0.0.0/16"]
}

##----------------------------------------------------------------------------- 
## Subnet 
##-----------------------------------------------------------------------------
module "subnet" {
  source               = "clouddrove/subnet/azure"
  version              = "1.2.1"
  name                 = "app"
  environment          = "test"
  resource_group_name  = module.resource_group.resource_group_name
  location             = module.resource_group.resource_group_location
  virtual_network_name = module.vnet.vnet_name

  #subnet
  subnet_names    = ["subnet1"]
  subnet_prefixes = ["10.0.1.0/24"]

  # route_table
  enable_route_table = false
  routes = [
    {
      name           = "rt-test"
      address_prefix = "0.0.0.0/0"
      next_hop_type  = "Internet"
    }
  ]
}

##----------------------------------------------------------------------------- 
## Log Analytics
##-----------------------------------------------------------------------------
module "log-analytics" {
  source                           = "clouddrove/log-analytics/azure"
  version                          = "1.1.0"
  name                             = "app"
  environment                      = "test"
  label_order                      = ["name", "environment"]
  create_log_analytics_workspace   = true
  log_analytics_workspace_sku      = "PerGB2018"
  resource_group_name              = module.resource_group.resource_group_name
  log_analytics_workspace_location = module.resource_group.resource_group_location
  log_analytics_workspace_id       = module.log-analytics.workspace_id
}

##----------------------------------------------------------------------------- 
## Mssql Server database
##-----------------------------------------------------------------------------
module "mssql-server" {
  depends_on = [module.resource_group, module.vnet]
  source     = "../.."

  name                  = "app"
  environment           = "test"
  create_resource_group = false
  resource_group_name   = module.resource_group.resource_group_name
  location              = module.resource_group.resource_group_location

  sqlserver_name                 = "mssqldbserver"
  database_name                  = "demomssqldb"
  db_sku_name                    = "Basic"
  sql_server_version             = "12.0"
  enable_threat_detection_policy = true
  enable_private_endpoint        = true
  virtual_network_name           = module.vnet.vnet_name
  existing_subnet_id             = module.subnet.default_subnet_id[0]
  enable_diagnostic              = false
  # log_analytics_workspace_id     = module.log-analytics.workspace_id (Use it when enable_diagnostic = true)
}
