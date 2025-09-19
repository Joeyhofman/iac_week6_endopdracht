data "azurerm_ssh_public_key" "skylab" {
  name                = var.ssh_key_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_virtual_network" "vnet" {
  name                = "azure-portainer"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "subnet" {
  name                 = "subnet-ubuntu"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_public_ip" "pip" {
  name                = "pip-ubuntu"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
  sku                 = "Basic"
}

resource "azurerm_network_interface" "nic" {
  name                = "nic-portianer"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
}

resource "azurerm_linux_virtual_machine" "azure_app_vm" {
  name                = "portainer"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = "Standard_DS1_v2"
  admin_username      = "joey"

  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  admin_ssh_key {
    username   = "joey-"
    public_key = data.azurerm_ssh_public_key.skylab.public_key
  }
  custom_data = base64encode(templatefile("${path.module}/userdata.yml", {
    ssh_key = data.azurerm_ssh_public_key.skylab.public_key
  }))
}
