output "id" {
  value = azurerm_nat_gateway.this.id
}

output "subnet_associations" {
  value = azurerm_subnet_nat_gateway_association.this
}
