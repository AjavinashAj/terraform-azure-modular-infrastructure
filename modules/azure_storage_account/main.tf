resource "azurerm_storage_account" "storage_block" {

    for_each = var.stg_accounts
  name                     = each.value.stg_account_name
  resource_group_name      = each.value.rg-name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type


}


