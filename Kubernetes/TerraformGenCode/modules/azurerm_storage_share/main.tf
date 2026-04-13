resource "azurerm_storage_share" "file_share" {
  for_each = var.fileshares

  name               = each.value.fileshare_name
  storage_account_id = var.stg_account_ids[each.value.stg_account_key]
  quota              = each.value.quota
}