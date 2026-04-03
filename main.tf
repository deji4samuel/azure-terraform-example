terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.67.0"
    }
  }
}

provider "azurerm" {
    features {
      resource_group {
      prevent_deletion_if_contains_resources = false
    }
    }
}

resource "azurerm_resource_group" "example" {
  name     = "my-terraform-rg"
  location = "UK South"
}

resource "azurerm_storage_account" "example" {
  name                     = "mysac011222"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}