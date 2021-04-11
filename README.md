![Terraform](https://github.com/holgerson97/terraform-azure-domain-services/actions/workflows/checks.yml/badge.svg)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

# Terraform Azure Active Directory Domain Services

This module adds Azure Domain Services to your resource group. The AADDS has no explicit resource so it's going to be deployed by a template deployment. In order to use this module you need a resouce group with atleast one subnet.

&nbsp;
# Requirements
| Software           |  Version  |
| :----------------- | :-------- |
| terraform          | >= 0.14.8 |
| hashicorp/azurerm  | >= 2.42.0 |


&nbsp;

**NOTE:** Other versions my work too, but it's only tested with the versions above.

&nbsp;
# Getting Started
```hcl
module "azure_adds" {

    source  = "github.com/holgerson97/terraform-azure-domain-services//module"

    rg_name     = azurerm_resource_group.name
    location    = var.location
    subnet-name = azurerm_subnet.example.name
    subnet-id   = azurerm_subnet.example.id
    vnet-name   = azurerm_virtual_network.example.name

}
```

&nbsp;
# Variables
| Variable                  |  Type  | Description                                                                |
| :-------------------------| :----: | :--------------------------------------------------------------------------|
| rg_name                   | string | Name of the resource group where you want to deploy your resources.        |
| location                  | string | Location of the resource group where you want to deploy your resources.    |
| subnet_name               | string |Subnet name where you want to deploy your resources.                        |
| subnet_id                 | string | ID of subnet where you want to deploy your resources.                      |
| vnet_name                 | string | VNET name where you want to deploy your resources.                         |
| domain_configuration_type | string | Specify if you want to sync everything or assets inside a scope.           |
| domain_name               | string | Name of the domain you want to use.                                        |
| filtered_sync             | string | Specify which scope you want to sync between Azure AD and domain services. |
| sku                       | string | Choose SKU for your domain services.                                       |


&nbsp;
# Deployed ? What now ? 

You probably need to configure your domain. Click on the resource in your resource group and configure your LDAP since it can't be configured via LDAP. You may also want to add a connection to your services that need to authenticate via LDAP.

&nbsp;
## Contributing
Feel free to create pull requests.