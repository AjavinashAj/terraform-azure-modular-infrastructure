resource "azurerm_public_ip" "public_ip_block" {
  for_each            = var.public_ips
  name                = each.value.public_ip_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = each.value.allocation_method
  sku                 = lookup(each.value, "sku", "Standard")
}
