# backend declarations
terraform {
  backend "azurerm" {
    container_name       = "tf-state-dev"
    resource_group_name  = "rg-Terraform"
    storage_account_name = "sascrearepo"
    subscription_id      = "0e06fee6-b7f3-4194-979a-e16195abcbfa" # StoreAssociateTechProd
    tenant_id            = "8331e14a-9134-4288-bf5a-5e2c8412f074"
  }
}

# terraform {
#   experiments = [module_variable_optional_attrs]
# }
