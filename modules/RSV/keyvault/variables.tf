variable "application_name" {}
variable "environment" {}
variable "resource_group_name" {}
#variable "SPM" {}
variable "tenant_id" {}
variable "object_id" {}
variable "azure_location" {}
variable "owner" {}

variable "enabled_for_deployment" {
  type = bool
}

variable "enabled_for_disk_encryption" {
  type = bool
}

variable "enabled_for_template_deployment" {
  type = bool
}

variable "key_vault_name" {}

variable "kv_virtual_network_subnet_ids" {
  description = "Kv vnet subner ID"
  type        = list(string)
}
