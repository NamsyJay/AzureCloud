output "azure_subnet_id" {
    value = {
        for id in keys(var.subnets) : id => azurerm_subnet.subnet[id]
    }
    description = "List the IDs of the subnets"
}

output "bastion_pubip" {
    value       = azurerm_public_ip.bastion_public_ip.public_ip_address_id
    description = "List the public IP of the bastion server"
}
