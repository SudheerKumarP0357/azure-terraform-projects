resource "tls_private_key" "main" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# resource "local_file" "private_key" {
#   content  = tls_private_key.main.private_key_pem
#   filename = "${path.module}/id_rsa"
# }

# resource "local_file" "public_key" {
#   content  = tls_private_key.main.public_key_openssh
#   filename = "${path.module}/id_rsa.pub"
# }

resource "azurerm_key_vault_secret" "ssh_public_key" {
  name         = "ssh-public-key"
  value        = tls_private_key.main.public_key_openssh
  key_vault_id = azurerm_key_vault.main.id
}

resource "azurerm_key_vault_secret" "ssh_private_key" {
  name         = "ssh-private-key"
  value        = tls_private_key.main.private_key_pem
  key_vault_id = azurerm_key_vault.main.id
}