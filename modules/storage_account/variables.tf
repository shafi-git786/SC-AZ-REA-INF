## storage account variables

variable "location" {
  description = "loaction"
  type        = string

}
variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}
variable "storage_ac_name" {
  description = "storage account name"
  type        = string
}
variable "account_tier" {
  description = "storage account performance"
  type        = string
}
variable "account_replication_type" {
  description = "storage account replication type"
  type        = string
}
variable "account_kind" {
  description = "storage account type"
  type        = string
}
variable "access_tier" {
  description = "storage account access_tier"
  type        = string
}
variable "sa_subnet_id" {
  type = string
}
variable "environment" {}
variable "application_name" {}
variable "owner" {}

## Storage account prvate endpoint
variable "sa_pe_name" {}
variable "subnet_id" {}
variable "sa_pdzg_name" {}
variable "private_dns_zone_ids" {}
variable "sa_pe_connection_name" {}
variable "sa_subresource_names" {}
variable "public_network_access_enabled" {
  type = bool
}
