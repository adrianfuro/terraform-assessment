# Module for deploying Loadbalancer resources

resource "azurerm_lb" "vmss" {
 name                = "vmss-lb"
 location            = var.location
 resource_group_name = var.rg

 frontend_ip_configuration {
   name                 = "PublicIPAddress"
   public_ip_address_id = var.public_ip_address_id
 }

}

resource "azurerm_lb_backend_address_pool" "bpepool" {
 loadbalancer_id     = azurerm_lb.vmss.id
 name                = "BackEndAddressPool"
}

resource "azurerm_lb_probe" "vmss" {
 loadbalancer_id     = azurerm_lb.vmss.id
 name                = "ssh-running-probe"
 port                = var.application_port
}

resource "azurerm_lb_rule" "lbnatrule" {
   loadbalancer_id                = azurerm_lb.vmss.id
   name                           = "http"
   protocol                       = "Tcp"
   frontend_port                  = var.application_port
   backend_port                   = var.application_port
   backend_address_pool_ids       = [ azurerm_lb_backend_address_pool.bpepool.id ]
   frontend_ip_configuration_name = "PublicIPAddress"
   probe_id                       = azurerm_lb_probe.vmss.id
}