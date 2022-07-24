resource "azurerm_resource_group" "this" {
  name     = uuid()
  location = "westeurope"
}

data "azurerm_client_config" "this" {}

module "nat" {
  source                              = "./module"
  name                                = "nat-example"
  resource_group_name                 = azurerm_resource_group.this.name
  location                            = azurerm_resource_group.this.location
  subscription_id                     = data.azurerm_client_config.this.subscription_id
  virtual_network_name                = "myVnetName"
  virtual_network_resource_group_name = "myVnetResourceGroupName"
  subnets_to_associate                = ["mySubnet_1", "mySubnet_2"]
}
