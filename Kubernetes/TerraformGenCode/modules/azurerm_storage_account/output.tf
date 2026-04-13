output "stg_accounts" {
   value = {for key, stg in azurerm_storage_account.stg : key => stg.id }
  
}