# rgs = {
#   "rg1" = {
#     rg_name    = "rg-prabha"
#     location   = "Central India"
#     managed_by = "terraform"
#     tag = {
#       env     = "dev"
#       project = "Demo"
#     }
#   }
# }

# aks_clusters = {
#   aks1 = {
#     name                = "prabha-aks"
#     location            = "Central India"
#     resource_group_name = "rg-prabha"
#     dns_prefix          = "prabhaaks"
#     node_count          = 1
#     vm_size             = "Standard_D2s_v3"  # Standard_A2_v2
#   }
# }


# stg_accounts = {
#   "stg1" = {
#     stg_name                 = "prabhastg1221"
#     rg_name                  = "rg-prabha"
#     location                 = "Central India"
#     account_tier             = "Standard"
#     account_replication_type = "LRS"
#     tags = {
#       env     = "dev"
#       project = "Demo"
#     }
#   }
# }

# fileshares = {
#   "fs1" = {
#     fileshare_name = "phabha-share"
#     stg_account_key = "stg1"
#     quota          = 5
#   }
# }

# acr_registries = {
#   acr1 = {
#     name                = "prabhacr12345"
#     resource_group_name = "rg-prabha"
#     location            = "Central India"
#     sku                 = "Basic"
#     admin_enabled       = true

#     tags = {
#       env = "dev"
#       project = "Demo"
#     }
#   }
# }