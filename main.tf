# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "vmss" {
 name     = var.resource_group_name
 location = var.location
}

module "networking" {
  source = "./modules/networking"
  
  azurerm_public_ip = "vmss-public-ip"
  azurerm_subnet_name = "vmss-subnet"
  location = azurerm_resource_group.vmss.location
  rg = azurerm_resource_group.vmss.name
}

module "lb" {
  source = "./modules/loadbalancer"

  location = var.location
  rg = azurerm_resource_group.vmss.name
  public_ip_address_id = module.networking.vmss_public_ip_id
}

module "vmss" {
  source = "./modules/vmss"

  location = var.location
  rg = azurerm_resource_group.vmss.name
  lb_backend_address_pool_id = [ module.lb.lb_id ]
  subnet_id = module.networking.subnet_id
}