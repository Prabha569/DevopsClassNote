output "file_share_ids" {

  value = {for key, file_share in azurerm_storage_share.file_share : key => file_share.id  }
  
}