terraform {
  required_providers {
    azurerm = { source  = "hashicorp/azurerm", version = "=4.4.0"}
    esxi = { source  = "josenk/esxi", version = "~> 1.6"}
  }
}

provider "azurerm" {
  features {}
}

provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server
  allow_unverified_ssl = true
}
