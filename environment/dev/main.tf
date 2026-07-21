module "rg_module"{
    source="../../module/azure_resource_group"
    rgs=var.resource_group
}

module "vnet_moduel"{
    depends_on=[module.rg_module]
    source="../../module/azure_virtual_network"
    vnets=var.virtual_network
}

module "subnet_block" {
    depends_on = [ module.vnet_moduel ]
    source = "../../module/azure_subnet"
    subnets=var.subnets  
}

module "public_ip_module" {
    depends_on = [ module.rg_module ]
    source = "../../module/azure_public_ip"
    public_ips = var.public_ips
  
}

module "vim_module" {
    depends_on = [ module.public_ip_module,module.subnet_block ]
    source = "../../module/azure_Virtual_machine"
    vms=var.vms
  
}

