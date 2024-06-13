#Specifying the provider, version, and backend to use
terraform {
  required_version = "~> 1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
  }
}


provider "azurerm" {
  #subscription_id            = "ccf1c13d-2c0d-4551-9fae-2e1cf0e9f2ec"
  skip_provider_registration = "true"
  features {}
}
