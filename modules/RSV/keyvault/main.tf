resource "azurerm_key_vault" "keyvault" {

  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_template_deployment = var.enabled_for_template_deployment
  location                        = var.azure_location
  name                            = var.key_vault_name
  purge_protection_enabled        = true
  resource_group_name             = var.resource_group_name
  sku_name                        = "standard"
  soft_delete_retention_days      = 90
  tags = {
    #SPM                 = var.SPM
    environment      = var.environment
    application_name = var.application_name
    description      = "TAS/Kalibrate Application"
    owner            = var.owner
  }
  tenant_id = var.tenant_id
  #tenant_id = data.azurerm_client_config.current.tenant_id


  network_acls {
    bypass                     = "AzureServices"
    default_action             = "Deny"
    ip_rules                   = ["158.48.0.0/16"]
    virtual_network_subnet_ids = [var.kv_virtual_network_subnet_ids[0]]
  }
}



resource "azurerm_key_vault_access_policy" "access_policy1" {
  key_vault_id = azurerm_key_vault.keyvault.id
  tenant_id    = var.tenant_id
  object_id    = var.object_id
  #tenant_id               = data.azurerm_client_config.current.tenant_id
  #object_id               = data.azurerm_client_config.current.object_id
  certificate_permissions = [
    "Backup", "Create", "Delete", "Get", "Import", "List", "Purge", "Recover", "Restore", "Update", "Recover",
  ]
  key_permissions = [
    "Get", "List", "Recover", "Restore", "Delete", "Purge", "Recover",
  ]
  #Secret permissions set for the service principal account (backup, get, list, recover, restore, set)
  secret_permissions = [
    "Get", "List", "Recover", "Restore", "Delete", "Purge", "Recover", "Backup", "Set",
  ]
  storage_permissions = [
    "Get", "List", "Recover", "Restore", "Set", "Delete", "Purge", "Recover",
  ]

}
