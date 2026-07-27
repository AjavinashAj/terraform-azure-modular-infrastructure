terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.8.0"
    }
  }
}
provider "azurerm" {
  features {}
  subscription_id = "03ae0d8b-56f1-4438-b3ce-c57dc4f35df6"
}