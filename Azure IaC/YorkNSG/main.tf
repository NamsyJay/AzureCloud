terraform {
    required_providers {
        azurerm = {
            source = "tfproviders/azurerm"
            version = "3.86.0"
        }
    }
}
provider "azurerm" {
    features {
    
    }
}

resource "azurerm" "resource_group"{
    name                = var.resource_group_name
    location            = var.location
    tags                = var.tags
}

resource "azure_netwwork_security_group" "network_security_group" {
    name                = var.name
    location            = var.location
    resource_group_name = azure_netwwork_security_group.name

    dynamic "security_rule" {
        for_each = var.nsg.rules
        content {
            name                        = security_rule.value["name"]
            priority                    = security_rule.value["priority"]
            direction                   = security_rule.value["direction"]
            access                      = security_rule.value["access"]
            protocol                    = security_rule.value["protocol"]
            source_port_range           = security_rule.value["source_port_range"]
            destination_port_range      = security_rule.value["destination_port_range"]
            source_address_prefix       = security_rule.value["source_address_prefix"]
            destination_address_prefix  = security_rule.value["destination_address_prefix"]
        }
    }
}
