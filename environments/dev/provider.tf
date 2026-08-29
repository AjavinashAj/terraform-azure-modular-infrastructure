terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.0.0"
    }
  }
  backend "azurerm" {
    
    tenant_id            = "b5442b50-7a5e-415c-ae67-fecb43704c91"  
    subscription_id      = "c9716a7e-f1f8-4398-8421-9f293e9eef04"  
    resource_group_name  = "EY-rg"          
    storage_account_name = "eystorage01"                              
    container_name       = "eycontainer"                               
    key                  = "dev.eycontainer"               
  }
}
provider "azurerm" {
  features {}
  
}