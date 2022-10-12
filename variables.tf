variable "location" {
 description = "The location where resources will be created"
 default     = "North Europe"
 type = string
}

variable "resource_group_name" {
 description = "The name of the resource group in which the resources will be created"
 default     = "VMSS"
 type = string
}

locals {
  regions_with_availability_zones = ["northeurope"]
  zones = contains(local.regions_with_availability_zones, var.location) ? list("1","2","3") : null
}