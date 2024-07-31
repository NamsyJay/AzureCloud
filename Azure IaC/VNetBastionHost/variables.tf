variable "resourcegroup_name" {
    type = string
    description = "The name of the resource group."
    default = "TFazureLWP007"
}

variable "location" {
    type        = string
    description = "The region for the deployment"
    default     = "West Europe"
}

variable "tags" {
    type        = map(string)
    description = "Tags used for the deployment"
    default     = {
        "Environment" = "Lab"
        "Owner" = "Jay"
    }
}

variable "address_space" {
    type        = list(string)
    description = "The address space for the VNET"
    default     = ["10.13.0.0/16"] 
}

variable "vnet_name" {
    type        = string
    description = "The name of the VNet"
    default     = "VnetLWP"
}

variable "subnets" {
    type        = map(any)
    default     = {
        subnet1 = {
            name                = "Subnet1"
            address_prefixes    = ["10.13.1.0/24"] 
        }
        subnet2 = {
            name                = "Subnet2"
            address_prefixes    = ["10.13.2.0/24"] 
        }
        subnet3 = {
            name                = "Subnet3"
            address_prefixes    = ["10.13.3.0/24"] 
        }
        # Azure BastionSubnet
        bastion_subnet = {
            name                = "AzureBastionSubnet"
            address_prefixes    = ["10.13.250.0/24"]
        }
    }
}

variable "bastionhost_name" {
    type        = string
    description = "The public IP address for the Azure Bastion Host"
    default     = "BastionHost"
}
