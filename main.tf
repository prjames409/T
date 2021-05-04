provider "azurerm"{
    version = "2.26.0"
    subscription_id = var.subscription_id
    features {}
}

# prod resource group for Virtual network 
resource "azurerm_resource_group" "rg_prod"{
    name     = var.rg_prod
    location = var.rg_location
    
}

resource "azurerm_virtual_network" "production_vnet" {
  name                = var.vnet_name
  location            = var.rg_location
  resource_group_name = azurerm_resource_group.rg_prod.name
  address_space       = [var.prod_vnet_address_space]
}

#subnet {
   # name = "testsubnet"
  #  address_prefix      = var.subnet_address_cidr[0]
#}

#subnet {
   # name = "test2"
   # address_prefix      = var.subnet_address_cidr[1]
#}

#subnet {
#    name = "test3"
    #address_prefix      = var.subnet_address_cidr[2]
#}

#}

resource "azurerm_subnet" "example" {
    name                    = "frontend"
    resource_group_name     = var.rg_prod
    virtual_network_name    = azurerm_virtual_network.production_vnet.name
    address_prefixes          = ["10.0.5.0/24"]
}


resource "azurerm_route_table" "prod_default_route" {
  name                          = "prod_default_route"
  location                      = var.rg_location
  resource_group_name           = var.rg_prod
  disable_bgp_route_propagation = true


  route {
      name = "default_route"
      address_prefix = "0.0.0.0/0"
      next_hop_type  = "VirtualAppliance"
      next_hop_in_ip_address    = "172.22.8.10"
    }
}

  resource "azurerm_subnet_route_table_association" "prod_default_route_association" {
    subnet_id      = azurerm_subnet.example.id
    route_table_id = azurerm_route_table.prod_default_route.id
    
}

#resource "azurerm_virtual_network_peering" "vnet_transport_peer" {
 # name                      = "production_vnet_to_transport_peer"
 # resource_group_name       = var.rg_prod
 # virtual_network_name      = azurerm_virtual_network.production_vnet.name
 # remote_virtual_network_id = data.azurerm_virtual_network.existing 
 # allow_virtual_network_access = true
  #allow_forwarded_traffic   = true
  #allow_gateway_transit     = true
  #use_remote_gateways       = false
#}

#resource "azurerm_subnet" "prod_subnet" {
#subnet_names                           = ["testsubnet","test2","test3"]
#subnet_prefixes                       = ["10.0.1.0/24","10.0.2.0/24","10.0.3/24"]
#resource_group_name                    = var.rg_prod
#virtual_network_name                   = azurerm_virtual_network.production_vnet.name

#}