# variable "rgs" {
#   description = "This is RG Variable"
#   type = map(object({
#     rg_name    = string
#     location   = string
#     managed_by = optional(string)
#     tags       = optional(map(string))
#   }))
# }

# variable "aks_clusters" {
#   type = map(object({
#     name                = string
#     location            = string
#     resource_group_name = string
#     dns_prefix          = string
#     node_count          = number
#     vm_size             = string
#   }))
# }


# variable "stg_accounts" {
#   description = "This is Storage Account variable"
#   type = map(object({
#     stg_name                 = string
#     rg_name                  = string
#     location                 = string
#     account_tier             = string
#     account_replication_type = string
#     tags                     = optional(map(string))
#   }))
# }

# variable "fileshares" {
#   description = "Map of file shares"
#   type = map(object({
#     fileshare_name = string
#     stg_account_key = string
#     quota          = number
#   }))
# }


# variable "acr_registries" {
#   description = "ACR configurations"
#   type = map(object({
#     name                = string
#     resource_group_name = string
#     location            = string
#     sku                 = string
#     admin_enabled       = bool

#     tags = map(string)
#   }))
# }