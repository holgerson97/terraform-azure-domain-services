terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.42.0"
    }
  }
}

provider "azurerm" {

    client_id       = "xxxxxxxxxxxxxxxxxxxxxxx"
    client_secret   = "xxxxxxxxxxxxxxxxxxxxxxx"
    subscription_id = "xxxxxxxxxxxxxxxxxxxxxxx"
    tenant_id       = "xxxxxxxxxxxxxxxxxxxxxxx"

}

resource "azurerm_resource_group" "example" {

  name     = "example"
  location = "West Europe"
  
}

resource "azurerm_virtual_network" "example" {

  name                = "virtualNetwork1"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = ["10.0.0.0/16"]

}

resource "azurerm_subnet" "example" {

  name                 = "example-subnet"
  resource_group_name  = "example"
  virtual_network_name = "virtualNetwork1"
  address_prefixes     = ["10.0.1.0/24"]
  
}

module "azure_adds" {

    source  = "github.com/holgerson97/terraform-azure-domain-services//module"

    rg_name     = "example"
    location    = "West Europe"
    subnet_name = "example-subnet"
    subnet_id   = ""
    vnet_name   = "virtualNetwork1"

}