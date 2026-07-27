data "azurerm_subnet" "bastion_subnet" {
  for_each             = var.bastions
  name                 = each.value.bastion_subnet_name
  virtual_network_name = each.value.bastion_vnet_name
  resource_group_name  = each.value.rg_name
}

data "azurerm_public_ip" "bastion_pip" {
  for_each            = var.bastions
  name                = each.value.bastion_pip_name
  resource_group_name = each.value.rg_name
}
