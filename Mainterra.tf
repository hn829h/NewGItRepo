provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "~>1.5"
}

resource "azurerm_resource_group" "main" {
  name     = "${var.prefix}-RG"
  location = var.location
}