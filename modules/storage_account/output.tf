output "storage-account-id" {
  value = azurerm_storage_account.storage-account.id
}
output "storage-account-name" {
  value = azurerm_storage_account.storage-account.name
}
output "storage-account-primary-blob-endpoint" {
  value = azurerm_storage_account.storage-account.primary_blob_endpoint
}

output "storage-account-primary-key" {
  value     = azurerm_storage_account.storage-account.primary_access_key
  sensitive = true
}

output "storage-account-secondary-key" {
  value     = azurerm_storage_account.storage-account.secondary_access_key
  sensitive = true
}

output "storage-account-primary_connection_string" {
  value     = azurerm_storage_account.storage-account.primary_connection_string
  sensitive = true
}

output "storage-account-secondary_connection_string" {
  value     = azurerm_storage_account.storage-account.secondary_connection_string
  sensitive = true
}
