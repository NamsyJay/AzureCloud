resource "azurerm_network_interface" "netinterface" {
    name                = "${var.vname}-nic"
    location            = var.location
    resource_group_name = var.rgname

    ip_configuration {
        name                            = "internal" 
        subnet_id                       = var.subnet_id
        private_ip_address_allocation   =  "Dynamic"
    } 
}

resource "azurerm_windows_virtual_machine" "vm" {
    name                    = var.vname
    resource_group_name     = var.rgname
    location                = var.location
    size                    = var.size
    admin_username          = var.localadmin
    admin_password          = var.localpassword
    network_interface_ids   = [
        azurerm_network_interface.netinterface.id,
    ] 


    os_disk {
        caching                 = "ReadWrite"
        storage_account_type    = "Standard_LRS"
    }

    source_image_reference {
        publisher                   = "MicrosoftWindowsServer"
        offer                       = "WindowsServer"
        sku                         = "2019-Datacenter"
        version                     = "latest"
    }
}
