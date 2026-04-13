terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.33.0"
    }
  }

  # backend "azurerm" {
  #   resource_group_name  = "rg-krishna"
  #   storage_account_name = "krishnastg567"
  #   container_name       = "tfstate"
  #   key                  = "dev.terraform.tfstate"
  # }

}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
  subscription_id = "ba69f29b-1144-4ed4-8949-2a03175f4f4e"

}
