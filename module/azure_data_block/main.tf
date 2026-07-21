# data "azurerm_subnet" "subnet_data_block"{
#     for_each=var.nics
#     name=each.value.nic_subnet_nmae
#     virtual_network_name = each.value.nic_vnet_name
#     resource_group_name = each.value.nic_rg_name

# }


# data "azurerm_public_ip" "public_ip_data_block"{
#     for_each = var.nics
#     name=each.value.nic_pip_name
#     resource_group_name = each.value.nic_rg_name
# }