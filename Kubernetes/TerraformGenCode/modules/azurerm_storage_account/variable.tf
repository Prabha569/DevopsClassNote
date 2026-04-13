variable "stg_accounts" {
  description = "This is Storage Account variable"
  type = map(object({
    stg_name                 = string
    rg_name                  = string
    location                 = string
    account_tier             = string
    account_replication_type = string
    tags                     = optional(map(string))
  }))

}
