terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.42.0"
    }
  }
}

resource "azurerm_network_security_group" "domain-services-nsg" {
    name                 = "${var.rg-name}-nsg"
    location             = var.location
    resource_group_name  = var.rg-name
    security_rule        = [
        {
            access                                     = "Allow"
            description                                = ""
            destination_address_prefix                 = "*"
            destination_address_prefixes               = []
            destination_application_security_group_ids = []
            destination_port_range                     = "3389"
            destination_port_ranges                    = []
            direction                                  = "Inbound"
            name                                       = "AllowRD"
            priority                                   = 201
            protocol                                   = "Tcp"
            source_address_prefix                      = "CorpNetSaw"
            source_address_prefixes                    = []
            source_application_security_group_ids      = []
            source_port_range                          = "*"
            source_port_ranges                         = []
        },
        {
            access                                     = "Allow"
            description                                = ""
            destination_address_prefix                 = "*"
            destination_address_prefixes               = []
            destination_application_security_group_ids = []
            destination_port_range                     = "443"
            destination_port_ranges                    = []
            direction                                  = "Inbound"
            name                                       = "AllowSyncWithAzureAD"
            priority                                   = 101
            protocol                                   = "Tcp"
            source_address_prefix                      = "AzureActiveDirectoryDomainServices"
            source_address_prefixes                    = []
            source_application_security_group_ids      = []
            source_port_range                          = "*"
            source_port_ranges                         = []
        },
        {
            access                                     = "Allow"
            description                                = ""
            destination_address_prefix                 = "*"
            destination_address_prefixes               = []
            destination_application_security_group_ids = []
            destination_port_range                     = "5986"
            destination_port_ranges                    = []
            direction                                  = "Inbound"
            name                                       = "AllowPSRemoting"
            priority                                   = 301
            protocol                                   = "Tcp"
            source_address_prefix                      = "AzureActiveDirectoryDomainServices"
            source_address_prefixes                    = []
            source_application_security_group_ids      = []
            source_port_range                          = "*"
            source_port_ranges                         = []
        },
        {
            access                                     = "Allow"
            description                                = ""
            destination_address_prefix                 = "AzureActiveDirectoryDomainServices"
            destination_address_prefixes               = []
            destination_application_security_group_ids = []
            destination_port_range                     = "636"
            destination_port_ranges                    = []
            direction                                  = "Inbound"
            name                                       = "AllowSecureLDAP"
            priority                                   = 401
            protocol                                   = "Tcp"
            source_address_prefix                      = "*"
            source_address_prefixes                    = []
            source_application_security_group_ids      = []
            source_port_range                          = "*"
            source_port_ranges                         = []
        },
    ]
}

resource "azurerm_subnet_network_security_group_association" "ngs-association" {

  subnet_id                 = var.subnet-id
  network_security_group_id = azurerm_network_security_group.domain-services-nsg.id

  depends_on = [azurerm_network_security_group.domain-services-nsg]

}


resource "azurerm_template_deployment" "aadds" {

    name                = "resource-aadds-template"
    resource_group_name = var.rg-name
    template_body       = file("${path.module}/templates/aadds-template.json")
    parameters = {
        apiVersion              = "2017-06-01"
        domainConfigurationType = var.domain-configuration-type
        domainName              = var.domain-name
        filteredSync            = var.filtered-sync
        location                = var.location
        subnetName              = var.subnet-name
        vnetName                = var.vnet-name
        vnetResourceGroup       = var.rg-name
        sku                     = var.sku
    }
    deployment_mode = "Incremental"

}