# Module for deploying Network resources

resource "azurerm_virtual_network" "vmss" {
  name                = var.azurerm_virtual_network
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.rg
}

resource "azurerm_subnet" "vmss" {
  name                 = var.azurerm_subnet_name
  resource_group_name  = var.rg
  virtual_network_name = azurerm_virtual_network.vmss.name
  address_prefixes     = var.azurerm_subnet_prefix
}

resource "azurerm_public_ip" "vmss" {
  name                = var.azurerm_public_ip
  location            = var.location
  resource_group_name = var.rg
  allocation_method   = "Static"
}