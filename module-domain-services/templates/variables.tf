variable "rg-name" {
    
    description = "Name of the resource group where you want to deploy your resources."
    sensitive   = false

}

variable "location" {

    description = "Location of the resource group where you want to deploy your resources."
    sensitive   = false

}

variable "subnet-name" {

    description = "Subnet name where you want to deploy your resources."
    sensitive   = false

}

variable "subnet-id" {

    description = "ID of subnet where you want to deploy your resources."
    sensitive   = false

}

variable "vnet-name" {

    description = "VNET name where you want to deploy your resources."
    sensitive   = false

}

variable "domain-configuration-type" {

    default = "FullySynced"
    description = "Specify if you want to sync everything or assets inside a scope."
    sensitive   = false
    
}
variable "domain-name" {

    description = "Name of the domain you want to use."
    sensitive   = false
    
}
variable "filtered-sync" {

    default = "Disabled"
    description = "Specify which scope you want to sync between Azure AD and domain services."
    sensitive   = false
    
}

variable "sku" {

    default = "Standard"
    description = "Choose SKU for your domain services."
    sensitive   = false

}