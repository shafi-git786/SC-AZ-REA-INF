resource "azurerm_recovery_services_vault" "RSV_vault" {
  name                               = var.name
  location                           = var.location
  resource_group_name                = var.resource_group_name
  sku                                = var.sku
  public_network_access_enabled      = var.public_network_access_enabled
  immutability                       = var.immutability
  storage_mode_type                  = var.storage_mode_type
  cross_region_restore_enabled       = var.cross_region_restore_enabled
  classic_vmware_replication_enabled = var.classic_vmware_replication_enabled

  identity {
    type = "SystemAssigned"
  }
  tags = {
    #SPM                 = var.SPM
    environment      = var.environment
    application_name = var.application_name
    description      = "TAS/Kalibrate Application"
    owner            = var.owner
  }
  soft_delete_enabled = var.soft_delete_enabled

}

resource "azurerm_private_endpoint" "rsv_backup_pe" {
  name                = var.rsv_pe_name
  location            = azurerm_recovery_services_vault.RSV_vault.location
  resource_group_name = azurerm_recovery_services_vault.RSV_vault.resource_group_name
  subnet_id           = var.subnet_id
  private_dns_zone_group {
    name                 = var.rsv_pdzg_name
    private_dns_zone_ids = [var.private_dns_zone_ids[0]]
  }
  private_service_connection {
    name                           = var.rsv_pe_connection_name
    private_connection_resource_id = azurerm_recovery_services_vault.RSV_vault.id
    is_manual_connection           = false
    subresource_names              = var.rsv_subresource_names
  }
}
