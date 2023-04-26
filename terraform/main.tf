terraform {
  //create backend to store terraform state first - it cannot be created by this script
  backend "azurerm" {}

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
  //Authenticating to Azure

  //"We recommend using either a Service Principal or Managed Service Identity when running Terraform non-interactively (such as when running Terraform in a CI server) - and authenticating using the Azure CLI when running Terraform locally."
  //https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs
  //https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret

  //az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/{subscription_id}"

  //appId is the client_id defined in the output of the command above.
  //password is the client_secret defined in the output of the command above.
  //tenant is the tenant_id defined in the output of the command above.

  //export ARM_CLIENT_ID="00000000-0000-0000-0000-000000000000"
  //export ARM_CLIENT_SECRET="12345678-0000-0000-0000-000000000000"
  //export ARM_TENANT_ID="10000000-0000-0000-0000-000000000000"
  //export ARM_SUBSCRIPTION_ID="20000000-0000-0000-0000-000000000000"
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


