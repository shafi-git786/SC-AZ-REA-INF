variable "resource_group_name" {}
variable "location" {}
#variable "SPM" {}
variable "environment_tag" {}
variable "application_name" {}
variable "owner" {}
variable "key_vault_name" {}
variable "deploy_keyvault_resources" {}
variable "enabled_for_disk_encryption" {}
variable "enabled_for_template_deployment" {}
variable "enabled_for_deployment" {}
variable "object_id_group" {}
variable "kv_virtual_network_subnet_ids" {
  description = "Kv vnet subner ID"
  type        = list(string)
  default     = ["/subscriptions/0e06fee6-b7f3-4194-979a-e16195abcbfa/resourceGroups/networking-eastus2/providers/Microsoft.Network/virtualNetworks/sc-prod-eastus2-vnet/subnets/sc-tas-vm-prod-eastus2-sb"]
}
##storage_account variables
# variable "deploy_storage_account_resources" {}
# variable "storage_ac_name" {}
# variable "account_tier" {}
# variable "account_replication_type" {}
# variable "account_kind" {}
# variable "access_tier" {}
# variable "sa_subnet_id" {}

# variable "RSV_optional_variables" {
#   type = object({
#     immutability                       = optional(string)
#     storage_mode_type                  = optional(string)
#     cross_region_restore_enabled       = optional(bool)
#     classic_vmware_replication_enabled = optional(bool)
#   })

#   default = {
#     public_network_access_enabled      = null
#     immutability                       = null
#     storage_mode_type                  = null
#     cross_region_restore_enabled       = null
#     classic_vmware_replication_enabled = null
#   }

# }
# variable "rsv_name" {}
# variable "rsv_sku" {}
# variable "rsv_pep_name" {}
# variable "rsv_pep_subnet_id" {}
# variable "rsv_pdzg_name" {}
# variable "rsv_pe_connection_name" {}
# variable "rsv_subresource_names" {}
# variable "deploy_RSV_resources" {}
# variable "rsv_soft_delete_enabled" {
#   type = bool
# }
# variable "private_dns_zone_ids" {
#   type = list(string)
# }
# variable "public_network_access_enabled" {
#   type = bool

# }
# variable "sa_pep_name" {}
# variable "sa_pep_subnet_id" {}
# variable "sa_pdzg_name" {}
# variable "sa_pe_connection_name" {}
# variable "sa_subresource_names" {}
