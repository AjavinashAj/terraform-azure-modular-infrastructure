module "rg_module_prod" {
    source = "../../module/azure_resource_group"
    rgs = var.rgs
}
module "vnets_module_prod" {
    depends_on = [ module.rg_module_prod ]
    source = "../../module/azure_virtual_network"
    vnets = var.vnets
  
}
module "subnet_module_prod" {
    depends_on = [ module.vnets_module_prod ]
    source = "../../module/azure_subnet"
     subnets =var.subnets
}

