# data "azurerm_subnet" "subnet_data_block"{

#     for_each=var.nics
#     name=each.value.nic_subnet_name
#     virtual_network_name = each.value.nic_vnet_name
#     resource_group_name = each.value.nic_rg_name

# }


# data "azurerm_public_ip" "public_ip_data_block"{
#     for_each = var.nics
#     name=each.value.nic_pip_name
#     resource_group_name = each.value.nic_rg_name
# }


resource "azurerm_network_interface" "nic_block" {
  for_each            = var.vms
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                          = "black-ip"
    subnet_id                     = data.azurerm_subnet.subnet_data_block[each.key].id
    public_ip_address_id          = data.azurerm_public_ip.public_ip_data_block[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}


resource "azurerm_linux_virtual_machine" "virtual_machine_block" {
  for_each            = var.vms
  name                = each.value.vm_name
  resource_group_name = each.value.rg_name
  location            = each.value.location
  size                = each.value.vm_size
  admin_username      = each.value.admin_username
  admin_password      = each.value.admin_password

  network_interface_ids = [azurerm_network_interface.nic_block[each.key].id, ]

  disable_password_authentication = false
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }



}




