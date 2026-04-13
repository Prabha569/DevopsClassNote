output "rgs" {
  value = {for key, rg in azurerm_resource_group.rg : key => rg.id }
}


# 📌 Iska matlab:
# Dev level pe tum module ke RG IDs expose kar rahe ho