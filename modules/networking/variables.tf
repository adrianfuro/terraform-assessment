variable "rg" {
  type = string
}

variable "location" {
  type = string
}

variable "azurerm_virtual_network" {
  description = "The name of the virtual network in which the resources will be created"
  default     = "VMSSnet"
  type        = string
}

variable "azurerm_subnet_name" {
  description = "The name of the subnet"
  default     = "vmss-subnet"
  type        = string
}

variable "azurerm_subnet_prefix" {
  description = "The name of the subnet"
  default     = ["10.0.2.0/24"]
  type        = list(string)
}

variable "azurerm_public_ip" {
  description = "The name of the Public ip resource"
  default     = "vmss-public-ip"
  type        = string
}
