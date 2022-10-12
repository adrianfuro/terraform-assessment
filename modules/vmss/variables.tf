variable "rg" {
  type = string
}

variable "location" {
  type = string
}

variable "subnet_id" {
   type = string
}

variable "lb_backend_address_pool_id" {
  type = list(string)
}

variable "azurerm_virtual_machine_scale_set" {
  description = "Name of VMSS"
  default = "VMSS"
}

variable "admin_user" {
   description = "VM Scale Set admin user"
   default     = "azureuser"
}

variable "admin_password" {
   description = "Default password for admin account"
   default     = "Computer@123"
}