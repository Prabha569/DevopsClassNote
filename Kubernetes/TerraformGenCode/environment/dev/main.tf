# module "resource_group" {
#   source = "../../modules/azurerm_resource_group"

#   rgs = var.rgs
# }

# module "aks" {
#   source = "../../modules/azurerm_aks"

#   depends_on = [module.resource_group]

#   aks_clusters = var.aks_clusters
# }


# module "stg_account" {
#    source = "../../modules/azurerm_storage_account"
#    depends_on = [ module.resource_group ]

#    stg_accounts = var.stg_accounts
# }

# module "file_share" {
#   source = "../../modules/azurerm_storage_share"
#   depends_on = [ module.stg_account ]

#   fileshares = var.fileshares
#   stg_account_ids = module.stg_account.stg_accounts   # 👈 yahin se aa rahi value
# }



# module "acr" {
#   source = "../../modules/azurerm_container_registry"

#   acr_registries = var.acr_registries
# }