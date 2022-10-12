output "ip_address" {
  value = module.networking.vmss_public_ip
}

output "name" {
  value = azurerm_resource_group.vmss.name
}

output "location" {
  value = azurerm_resource_group.vmss.location
}