variable "rgname" {
    type        = "string"
    description = "The name of the resource group for the York server"
}

variable "location" {
    type        = "string"
    description = "The location for the deployment"
}

variable "subnet_id" {
    type        = "string"
    description = "The subnet ID for network card"
}

variable "vname" {
    type        = "string"
    description = "The name for the virtual machine"
}

variable "size" {
    type        = "string"
    description = "The size for the virtual machine"
}

variable "localadmin" {
    type        = "string"
    description = "The local administrator username"
}

variable "localpassword" {
    type        = "string"
    sensitive   = true
    description = "the password of the local administrator, must be 12 characters or longer"
}
