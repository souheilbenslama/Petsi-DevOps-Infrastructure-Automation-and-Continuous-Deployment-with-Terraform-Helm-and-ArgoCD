terraform {
  required_version = "~>1.3.4"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.31.0"
    }
  }

  backend "azurerm" {
    resource_group_name = "petsi_rg"
    container_name = "state"
    storage_account_name = "petsi"
    key = "provisionning-stack.json"
  }

}

provider "azurerm" {
  features {}
}