module "azure_app" {
  source   = "./azure"
  providers = {
    azurerm = azurerm
  }
}

module "esxi_app" {
  source   = "./esxi"
  providers = {
    esxi = esxi
  }
}