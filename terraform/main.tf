terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.44.1"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

  resource "azurerm_resource_group" "resource_group" {
  name     = var.resource_group_name
  location = "West US"
  lifecycle {
    ignore_changes = [
      # Ignore changes to tags, e.g. because a management agent
      # updates these based on some ruleset managed elsewhere.
      tags,
    ]
  }
}
