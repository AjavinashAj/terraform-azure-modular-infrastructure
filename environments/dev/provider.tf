terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.0.0"
    }
  }
  backend "azurerm" {
    
     resource_group_name  = "EY-rg"          
    storage_account_name = "eystorage01"                              
    container_name       = "eycontainer"                               
    key                  = "dev.eycontainer"               
  }
}
provider "azurerm" {
  features {}
  
}