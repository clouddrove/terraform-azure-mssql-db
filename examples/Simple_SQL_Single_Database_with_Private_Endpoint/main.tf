provider "azurerm" {
  features {}
}

module "resource_group" {
  source  = "clouddrove/resource-group/azure"
  version = "1.0.1"

  name        = "app"
  environment = "example"
  label_order = ["name", "environment"]
  location    = "Canada Central"
}

#Vnet
module "vnet" {
  source  = "clouddrove/virtual-network/azure"
  version = "1.0.3"

  name        = "app"
  environment = "example"
  label_order = ["name", "environment"]

  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
  address_space       = "10.0.0.0/16"
  enable_ddos_pp      = false

  #subnet
  subnet_names                  = ["subnet1", "subnet2"]
  subnet_prefixes               = ["10.0.1.0/24", "10.0.2.0/24"]
  disable_bgp_route_propagation = false

  # routes
  enabled_route_table = false
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
  source  = "./../.."

  name        = "app"
  environment = "example"
  label_order = ["environment", "name"]
  create_resource_group = false
  resource_group_name   = module.resource_group.resource_group_name
  location              = module.resource_group.resource_group_location

  sqlserver_name               = "mssqldbserver"
  database_name                = "demomssqldb"
  sql_database_edition         = "Standard"
  sqldb_service_objective_name = "S1"
  sql_server_version           = "12.0"
  enable_threat_detection_policy = true
  enable_private_endpoint       = true
  virtual_network_name          = module.vnet.vnet_name[0]
  private_subnet_address_prefix = ["10.0.3.0/24"]

}
