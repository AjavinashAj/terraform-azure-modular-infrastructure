module "rg_module" {
  source = "../../modules/azure_resource_group"
  rgs    = var.resource_group
}
module "storage_module"{
  depends_on = [ module.rg_module ]
  source = "../../modules/azure_storage_account"
  stg_accounts = var.stg_accounts
}
module "vnet_module" {
  depends_on = [module.rg_module]
  source     = "../../modules/azure_virtual_network"
  vnets      = var.virtual_network
}

module "subnet_block" {
  depends_on = [module.vnet_module]
  source     = "../../modules/azure_subnet"
  subnets    = var.subnets
}

module "public_ip_module" {
  depends_on = [module.rg_module]
  source     = "../../modules/azure_public_ip"
  public_ips = var.public_ips
}

module "vm_module" {
  depends_on = [module.public_ip_module, module.subnet_block]
  source     = "../../modules/azure_virtual_machine"
  vms        = var.vms
}

module "bastion_module" {
  depends_on = [module.public_ip_module, module.subnet_block]
  source     = "../../modules/azure_bastion"
  bastions   = var.bastions
}

