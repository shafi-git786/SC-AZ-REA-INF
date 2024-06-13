# Usage

<!--- BEGIN_TF_DOCS --->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_private_endpoint.rsv_backup_pe](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |
| [azurerm_recovery_services_vault.RSV_vault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/recovery_services_vault) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_name"></a> [application\_name](#input\_application\_name) | n/a | `any` | n/a | yes |
| <a name="input_classic_vmware_replication_enabled"></a> [classic\_vmware\_replication\_enabled](#input\_classic\_vmware\_replication\_enabled) | n/a | `bool` | `null` | no |
| <a name="input_cross_region_restore_enabled"></a> [cross\_region\_restore\_enabled](#input\_cross\_region\_restore\_enabled) | n/a | `bool` | `null` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `any` | n/a | yes |
| <a name="input_immutability"></a> [immutability](#input\_immutability) | n/a | `string` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | n/a | `any` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | n/a | `any` | n/a | yes |
| <a name="input_owner"></a> [owner](#input\_owner) | n/a | `any` | n/a | yes |
| <a name="input_private_dns_zone_ids"></a> [private\_dns\_zone\_ids](#input\_private\_dns\_zone\_ids) | n/a | `any` | n/a | yes |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | n/a | `bool` | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `any` | n/a | yes |
| <a name="input_rsv_pdzg_name"></a> [rsv\_pdzg\_name](#input\_rsv\_pdzg\_name) | n/a | `any` | n/a | yes |
| <a name="input_rsv_pe_connection_name"></a> [rsv\_pe\_connection\_name](#input\_rsv\_pe\_connection\_name) | n/a | `any` | n/a | yes |
| <a name="input_rsv_pe_name"></a> [rsv\_pe\_name](#input\_rsv\_pe\_name) | # RSV prvate endpoint | `any` | n/a | yes |
| <a name="input_rsv_subresource_names"></a> [rsv\_subresource\_names](#input\_rsv\_subresource\_names) | n/a | `any` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | n/a | `any` | n/a | yes |
| <a name="input_soft_delete_enabled"></a> [soft\_delete\_enabled](#input\_soft\_delete\_enabled) | n/a | `any` | n/a | yes |
| <a name="input_storage_mode_type"></a> [storage\_mode\_type](#input\_storage\_mode\_type) | n/a | `string` | `null` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_RSV_id"></a> [RSV\_id](#output\_RSV\_id) | n/a |

<!--- END_TF_DOCS --->
