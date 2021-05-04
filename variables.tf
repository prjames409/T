variable "rg_location"{
    description = "The location of the resource group"
    type        = string
}

variable "rg_prod"{
    description = "The name of the resource group associated with production environment"
    type        = string
}


#variable "rg_qa"{
    #description = "The name of the resource group associated with qa environment"
    #type        = string
#}

#variable "rg_dev"{
#    description = "The name of the resource asscociated with the dev environment"
 #   type        = string
#}

variable "prod_vnet_address_space" {
    description = "The address space assoicated with the subnet"
    type        = string
}

#variable "qa_vnet_address_space" {
#    description = "The address space assoicated with the subnet"
##    type        = string
#}

#variable "dev_vnet_address_space" {
#    description = "The address space assoicated with the subnet"
#    type        = string
#}

variable "resource_prefix" {
    description = "The name of the project being worked on"
    type = string
}


variable "subscription_id" {
    description = "The ID associcated witht the subscription"
    type        = string
}

variable "subnet_names" {
  description = "A list of public subnets inside the vNet."
  type        = list(string)
  default     = ["subnet1", "subnet2", "subnet3"]
}

variable "address_prefix" {
  description = "The address prefix to use for the subnet."
  type        = list(string)
  default     = ["10.0.1.0/24","10.0.2.0/24", "10.0.3.0/24"]
}

variable "vnet_name" {
  description = "Name of the vnet to create"
  type        = string
  default     = "acctvnet"
}

variable "subnet_address_cidr" {
description = ""
type        =list(string)

}

