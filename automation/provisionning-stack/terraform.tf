terraform {
  required_version = "~>1.3.4"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.31.0"
    }
  }

  backend "azurerm" {
    resource_group_name = "cloud-shell-storage-westeurope"
    container_name = "terastate"
    storage_account_name = "csb100320004f3944c2"
    key = "provisionning-stack.json"
  }

}

provider "azurerm" {
  features {}
}