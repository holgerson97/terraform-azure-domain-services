variable "rg_name" {

    description = "Name of the resource group where you want to deploy your resources."
    sensitive   = false

}

variable "location" {

    description = "Location of the resource group where you want to deploy your resources."
    sensitive   = false

}

variable "subnet_name" {

    description = "Subnet name where you want to deploy your resources."
    sensitive   = false

}

variable "subnet_id" {

    description = "ID of subnet where you want to deploy your resources."
    sensitive   = false

}

variable "vnet_name" {

    description = "VNET name where you want to deploy your resources."
    sensitive   = false

}

variable "domain_configuration_type" {

    default = "FullySynced"
    description = "Specify if you want to sync everything or assets inside a scope."
    sensitive   = false

}

variable "domain_name" {

    description = "Name of the domain you want to use."
    sensitive   = false

}

variable "filtered_sync" {

    default = "Disabled"
    description = "Specify which scope you want to sync between Azure AD and domain services."
    sensitive   = false

}

variable "sku" {

    default = "Standard"
    description = "Choose SKU for your domain services."
    sensitive   = false

}