terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "3.113.0"
        }
    }
}

provider "azurerm" {
    features {}
}

resource "azurerm_resource_group" "vnet_rg" {
    name        = var.resourcegroup_name
    location    = var.location
    tags        = var.tags
}

resource "azurerm_virtual_network" "vnet" {
    name                = var.vnet_name
    resource_group_name = azurerm_resource_group.vnet_rg.name
    location            = azurerm_resource_group.vnet_rg.location
    address_space       = var.address_space
    tags                = var.tags
}

resource "azurerm_subnet" "subnet" {
    for_each = var.subnets
    name                 = each.value["name"]
    address_prefixes     = each.value["address_prefixes"]
    resource_group_name  = var.resourcegroup_name
    virtual_network_name = var.vnet_name   
}

resource "azurerm_public_ip" "bastion_pubip" {
    name                = "${var.bastionhost_name}PubIP"
    resource_group_name = azurerm_resource_group.vnet_rg.name
    location            = azurerm_resource_group.vnet_rg.location
    allocation_method   = "Static"
    sku                 = "Standard"
    tags                = var.tags 
}

resource "azurerm_bastion_host" "bastion" {
    name                = var.bastionhost_name
    location            = azurerm_resource_group.vnet_rg.location
    resource_group_name = azurerm_resource_group.vnet_rg.name
    tags                = var.tags 

    ip_configuration {
        name                 = "bastion_config"
        subnet_id            = azurerm_subnet.subnet[bastion_subnet].id
        public_ip_address_id = azurerm_public_ip.bastion_pubip.id
    }
}
