variable "fileshares" {
  description = "Map of file shares"
  type = map(object({
    fileshare_name = string
    stg_account_key = string
    quota          = number
  }))
}

variable "stg_account_ids" {
  description = "Map of storage account IDs"
  type        = map(string)
}