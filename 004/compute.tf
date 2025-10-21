data "azurerm_subnet" "default" {
  name                 = "snet-p2-90v21jmb"
  virtual_network_name = "vnet-p2-90v21jmb"
  resource_group_name  = "rg-p2-90v21jmb"
}

resource "azurerm_public_ip" "main" {
  name = "pip-p4-${random_string.random.result}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  allocation_method   = "Static"
  sku = "Standard"
}

output "public_ip" {
  value = azurerm_public_ip.main.ip_address
}

resource "azurerm_network_interface" "main" {
  name                = "nic-p4-${random_string.random.result}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                          = "public"
    subnet_id                     = data.azurerm_subnet.default.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.main.id
  }
}

data "azurerm_key_vault" "keyvault" {
  name                = "kv-p3-hhc4zkj0"
  resource_group_name = "rg-p3-hhc4zkj0"
}

data "azurerm_key_vault_secret" "ssh_public_key" {
  name         = "ssh-public-key"
  key_vault_id = data.azurerm_key_vault.keyvault.id
}


resource "azurerm_linux_virtual_machine" "main" {
  name                = "vm-p4-${random_string.random.result}"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  size                = "Standard_B1s"
  admin_username      = "adminuser"

  network_interface_ids = [
    azurerm_network_interface.main.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = data.azurerm_key_vault_secret.ssh_public_key.value
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "latest"
  }
}