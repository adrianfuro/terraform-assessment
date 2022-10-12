variable "rg" {
  description = "Resource group"
  type = string
}

variable "location" {
  description = "location"
  type = string
}

variable "public_ip_address_id" {
  type = string
}

variable "application_port" {
   description = "The port that will be exposed to the external load balancer"
   default     = 80
}