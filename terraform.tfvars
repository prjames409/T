rg_location                   = "EastUs"                    #Description: The name of the location of the resource group
rg_prod                       = "sapafs_resourcegroup_prod"  #Description: The name of the production resource group
#rg_qa                         = "sapafs_resourcegroup_qa"   #Description: The name of the QA resource group
#rg_dev                        = "sapafs_resourcegroup_dev"  #Description: The name of the Dev resource group
resource_prefix               = "Azure subscription 1"        #Description: The name of the subscription 
prod_vnet_address_space       = "10.0.0.0/16"                #Description: The production  address space of the Vnet
#qa_vnet_address_space         = ""                           #Description: The qa address  space of the Vnet
#dev_vnet_address_space        = ""                           #Description: The development address space of the Vnet
subscription_id               = "962cba34-e419-48f6-b1c0-14c1b9de580c"                           #Description: The subscription ID
vnet_name                     = "prod_vnet"                  #Description: The name of the production vnet
subnet_address_cidr           = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]