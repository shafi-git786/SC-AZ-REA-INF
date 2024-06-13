variable "name" {}
variable "location" {}
variable "resource_group_name" {}
variable "sku" {}
variable "public_network_access_enabled" {
  type    = bool
  default = null
}
variable "immutability" {
  type    = string
  default = null
}
variable "storage_mode_type" {
  type    = string
  default = null
}
variable "cross_region_restore_enabled" {
  type    = bool
  default = null
}
variable "classic_vmware_replication_enabled" {
  type    = bool
  default = null
}
variable "environment" {}
variable "application_name" {}
variable "owner" {}
variable "soft_delete_enabled" {}

## RSV prvate endpoint
variable "rsv_pe_name" {}
variable "subnet_id" {}
variable "rsv_pdzg_name" {}
variable "private_dns_zone_ids" {}
variable "rsv_pe_connection_name" {}
variable "rsv_subresource_names" {}
