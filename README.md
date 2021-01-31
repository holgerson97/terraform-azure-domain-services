# terraform-azure-domain-services-module
Terraform module using azurerm provider and Azure ARM to deploy Azure domain services.

## How to use the module ? 

    module "domain-services" {

    source  = "ADD Source here"

    rg-name     = "Reference to resource group name."
    location    = "Reference to West Europe."
    subnet-name = "Reference to subnet name."
    subnet-id   = "Reference to subnet ID."
    vnet-name   = "Reference to VNET name."
    
    }
