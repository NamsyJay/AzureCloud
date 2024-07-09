terraform {
    required_providers {
        azurerm ={
            source = "hashicorp/azurerm"
            version = "=3.66.0"
        }
    }
}

provider "azurerm" {
    features {}
}

# create a resource group
resource "azurerm_resource_group" "resource_group" {
    name     = "rg-terraform-demo"
    location = "uksouth"
}

# create a storage account
resource "azurerm_storage_account" "storage_account" {
    name                     = "terraformazurenhs"
    resource_group_name      = azurerm_resource_group.resource_group.name
    location                 = azurerm_resource_group.resource_group.location
    account_tier             = "Standard"
    account_replication_type = "GRS"
    account_kind             = "StorageV2"

    static_website {
        index_document = "index.html"
    }
}


# Add index.html File
resource "azurerm_storage_blob" "blob" {
    name                   = "index.html"
    storage_account_name   = azurerm_storage_account.storage_account.name
    storage_container_name = "$web"
    type                   = "Block"
    content_type           = "text/html"
    source_content         = "<h1> WELCOME JAY!! </h1>"
}
