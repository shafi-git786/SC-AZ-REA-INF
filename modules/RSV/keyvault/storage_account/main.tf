resource "azurerm_storage_account" "storage-account" {
  name                          = var.storage_ac_name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  account_tier                  = var.account_tier
  account_replication_type      = var.account_replication_type
  account_kind                  = var.account_kind
  access_tier                   = var.access_tier
  public_network_access_enabled = var.public_network_access_enabled
  enable_https_traffic_only     = true
  tags = {
    #SPM                 = var.SPM
    environment      = var.environment
    application_name = var.application_name
    description      = "REA Application"
    owner            = var.owner
  }

  network_rules {
    default_action             = "Deny"
    virtual_network_subnet_ids = [var.sa_subnet_id]
    ip_rules                   = ["158.48.0.0/16"]
    bypass                     = ["AzureServices"]

  }
}
# resource "azurerm_storage_share" "storage-account-file-share" {
#   name                 = "storageaccountfileshare"
#   storage_account_name = "streadeveastus2001"
#   quota                = 5

# }

resource "azurerm_private_endpoint" "sa_pe" {
  name                = var.sa_pe_name
  location            = azurerm_storage_account.storage-account.location
  resource_group_name = azurerm_storage_account.storage-account.resource_group_name
  subnet_id           = var.subnet_id
  private_dns_zone_group {
    name                 = var.sa_pdzg_name
    private_dns_zone_ids = [var.private_dns_zone_ids[0]]
  }
  private_service_connection {
    name                           = var.sa_pe_connection_name
    private_connection_resource_id = azurerm_storage_account.storage-account.id
    is_manual_connection           = false
    subresource_names              = var.sa_subresource_names
  }
}
