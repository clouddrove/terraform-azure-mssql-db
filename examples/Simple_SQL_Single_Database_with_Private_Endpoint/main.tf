provider "azurerm" {
  features {}
}

module "resource_group" {
  source  = "clouddrove/resource-group/azure"
  version = "1.0.1"

  name        = "appm"
  environment = "example"
  label_order = ["name", "environment"]
  location    = "Canada Central"
}

module "vnet" {
  source              = "clouddrove/vnet/azure"
  version             = "1.0.1"
  name                = "app"
  environment         = "test"
  label_order         = ["name", "environment"]
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
  address_space       = "10.0.0.0/16"
  enable_ddos_pp      = false
}

module "subnet" {
  source               = "clouddrove/subnet/azure"
  version              = "1.0.0"
  name                 = "app"
  environment          = "test"
  label_order          = ["name", "environment"]
  resource_group_name  = module.resource_group.resource_group_name
  location             = module.resource_group.resource_group_location
  virtual_network_name = join("", module.vnet.vnet_name)

  #subnet
  default_name_subnet = true
  subnet_names        = ["subnet1"]
  subnet_prefixes     = ["10.0.1.0/24"]

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


module "mssql-server" {
  depends_on = [module.resource_group, module.vnet]
  source     = "./../.."

  name                  = "app"
  environment           = "example"
  label_order           = ["environment", "name"]
  create_resource_group = false
  resource_group_name   = module.resource_group.resource_group_name
  location              = module.resource_group.resource_group_location

  sqlserver_name                 = "mssqldbserver"
  database_name                  = "demomssqldb"
  sql_database_edition           = "Standard"
  sqldb_service_objective_name   = "S1"
  sql_server_version             = "12.0"
  enable_threat_detection_policy = true
  enable_private_endpoint        = true
  virtual_network_name           = module.vnet.vnet_name[0]
  existing_subnet_id             = module.subnet.default_subnet_id[0]
}
