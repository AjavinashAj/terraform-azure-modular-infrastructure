resource "azurerm_bastion_host" "bastion_block" {
  for_each            = var.bastions
  name                = each.value.bastion_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  sku                 = lookup(each.value, "sku", "Basic")

  ip_configuration {
    name                 = lookup(each.value, "ip_config_name", "bastion-ip-config")
    subnet_id            = data.azurerm_subnet.bastion_subnet[each.key].id
    public_ip_address_id = data.azurerm_public_ip.bastion_pip[each.key].id
  }
}
