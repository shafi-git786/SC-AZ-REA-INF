data "azurerm_client_config" "current" {}

module "keyvault" {

  count               = var.deploy_keyvault_resources ? 1 : 0
  source              = "./modules/keyvault"
  key_vault_name      = var.key_vault_name
  resource_group_name = var.resource_group_name
  azure_location      = var.location
  #SPM                            = var.SPM
  environment                     = var.environment_tag
  application_name                = var.application_name
  owner                           = var.owner
  tenant_id                       = data.azurerm_client_config.current.tenant_id
  object_id                       = data.azurerm_client_config.current.object_id
  kv_virtual_network_subnet_ids   = [var.kv_virtual_network_subnet_ids[0]]
  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_template_deployment = var.enabled_for_template_deployment
}

resource "azurerm_role_assignment" "rea-reader" {
  scope                = module.keyvault[0].keyvault_id
  role_definition_name = "Reader"
  principal_id         = data.azurerm_client_config.current.object_id
}

resource "azurerm_key_vault_access_policy" "access_policy_group" {
  key_vault_id = module.keyvault[0].keyvault_id
  #tenant_id    = var.tenant_id
  object_id = var.object_id_group
  tenant_id = data.azurerm_client_config.current.tenant_id
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

# module "storage_account" {

#   count                         = var.deploy_storage_account_resources ? 1 : 0
#   source                        = "./modules/storage_account"
#   storage_ac_name               = var.storage_ac_name
#   resource_group_name           = var.resource_group_name
#   location                      = var.location
#   account_tier                  = var.account_tier
#   account_replication_type      = var.account_replication_type
#   account_kind                  = var.account_kind
#   access_tier                   = var.access_tier
#   sa_subnet_id                  = var.sa_subnet_id
#   environment                   = var.environment_tag
#   application_name              = var.application_name
#   owner                         = var.owner
#   sa_pe_name                    = var.sa_pep_name
#   subnet_id                     = var.sa_pep_subnet_id
#   sa_pdzg_name                  = var.sa_pdzg_name
#   private_dns_zone_ids          = [var.private_dns_zone_ids[1]]
#   sa_pe_connection_name         = var.sa_pe_connection_name
#   sa_subresource_names          = var.sa_subresource_names
#   public_network_access_enabled = var.public_network_access_enabled

# }
# resource "azurerm_storage_share" "storage-account-file-share" {
#   name                 = "storageaccountfileshare"
#   storage_account_name = "streadeveastus2001"
#   quota                = 10

# }
# resource "azurerm_role_assignment" "sa-Contributor" {
#   scope                = module.storage_account[0].storage-account-id
#   role_definition_name = "Storage Account Contributor"
#   principal_id         = data.azurerm_client_config.current.object_id
# }
# resource "azurerm_storage_account" "az_file_sa" {
#   name                     = "testsarea"
#   resource_group_name      = "rg-sc-rea-dev-eastus2"
#   location                 = "eastus2"
#   account_tier             = "Premium"
#   account_kind             = "FileStorage"
#   account_replication_type = "LRS"

#   provisioner "local-exec" {
#     command = <<EOT
#     az storage share create `
#     --account-name ${azurerm_storage_account.az_file_sa.name} `
#     --account-key ${azurerm_storage_account.az_file_sa.primary_access_key} `
#     --name ${"testfilesharesa"} `
#     --quota 10   
#     EOT

#     interpreter = ["Powershell", "-c"]
#   }
# }


# network_rules {
#   default_action             = "Deny"
#   virtual_network_subnet_ids = ["/subscriptions/0e06fee6-b7f3-4194-979a-e16195abcbfa/resourceGroups/networking-eastus2/providers/Microsoft.Network/virtualNetworks/sc-nonprod-eastus2-vnet/subnets/sc-rea-vm-nonprod-eastus2-sb"]
#   ip_rules                   = ["158.48.0.0/16"]
#   bypass                     = ["AzureServices"]

# }

# resource "azurerm_storage_share" "file_share" {
#   name                 = "filesharerea"
#   storage_account_name = azurerm_storage_account.az_file_sa.name
#   quota                = 100
#   # enabled_protocol     = "NFS"


#   depends_on = [azurerm_storage_account.az_file_sa]
# }
# resource "azurerm_storage_account_network_rules" "test" {

#   storage_account_id = azurerm_storage_account.az_file_sa.id

#   default_action             = "Deny"
#   virtual_network_subnet_ids = ["/subscriptions/0e06fee6-b7f3-4194-979a-e16195abcbfa/resourceGroups/networking-eastus2/providers/Microsoft.Network/virtualNetworks/sc-nonprod-eastus2-vnet/subnets/sc-rea-vm-nonprod-eastus2-sb"]
#   bypass                     = ["AzureServices"]
#   ip_rules                   = ["158.48.0.0/16"]
#   depends_on                 = [azurerm_storage_account.az_file_sa]
# }
# module "RSV" {
#   count                         = var.deploy_RSV_resources ? 1 : 0
#   source                        = "./modules/RSV"
#   name                          = var.rsv_name
#   location                      = var.location
#   resource_group_name           = var.resource_group_name
#   sku                           = var.rsv_sku
#   environment                   = var.environment_tag
#   application_name              = var.application_name
#   owner                         = var.owner
#   public_network_access_enabled = var.public_network_access_enabled
#   rsv_pe_name                   = var.rsv_pep_name
#   subnet_id                     = var.rsv_pep_subnet_id
#   rsv_pdzg_name                 = var.rsv_pdzg_name
#   private_dns_zone_ids          = [var.private_dns_zone_ids[0]]
#   rsv_pe_connection_name        = var.rsv_pe_connection_name
#   rsv_subresource_names         = var.rsv_subresource_names
#   soft_delete_enabled           = var.rsv_soft_delete_enabled

# }
# resource "azurerm_role_assignment" "rsv-Contributor" {
#   scope                = module.RSV[0].RSV_id
#   role_definition_name = "Contributor"
#   principal_id         = data.azurerm_client_config.current.object_id
# }
