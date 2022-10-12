output "vmss_public_ip" {
  value = azurerm_public_ip.vmss.ip_address
}

output "vmss_public_ip_id" {
  value = azurerm_public_ip.vmss.id
}

output "subnet_id" {
  value = azurerm_subnet.vmss.id
}