terraform {
  required_providers {
    azurerm = { source = "hashicorp/azurerm", version = "=4.4.0" }
    esxi    = { source = "josenk/esxi", version = "~> 1.6" }
  }
}

provider "esxi" {
  esxi_hostname = "192.168.1.20"
  esxi_hostport = 22
  esxi_hostssl  = 443
  esxi_username = "root"
  esxi_password = "Infra123#"
}

provider "azurerm" {
  features {}
  resource_provider_registrations = "none"
  subscription_id                 = "c064671c-8f74-4fec-b088-b53c568245eb"
}