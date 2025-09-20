terraform {
  required_providers {
    azurerm = { source = "hashicorp/azurerm", version = "=4.4.0" }
    esxi    = { source = "josenk/esxi", version = "~> 1.6" }
  }
}

provider "esxi" {
  esxi_hostname = var.esxi_app_host
  esxi_hostport = var.esxi_app_ssh_port
  esxi_hostssl  = var.esxi_app_https_port
  esxi_username = var.esxi_app_user
  esxi_password = var.esxi_app_password
}

provider "azurerm" {
  features {}
  resource_provider_registrations = "none"
  subscription_id                 = var.azure_app_subscription_id
}