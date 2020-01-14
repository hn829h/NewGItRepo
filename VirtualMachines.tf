resource "azurerm_virtual_machine" "main" {
  count                 = var.node_count
  name                  = "${var.prefix}-web-${count.index}"
  location              = azurerm_resource_group.main.location
  resource_group_name   = azurerm_resource_group.main.name
  network_interface_ids = [element(azurerm_network_interface.main.*.id, count.index)]
  vm_size               = var.vm_size


    storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name              = "${var.prefix}-${count.index}-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "${var.prefix}-web-${count.index}"
    admin_username = var.admin_username
    
  }

  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
      key_data = file("~/.ssh/id_rsa.pub")
      path     = "/home/${var.admin_username}/.ssh/authorized_keys"
    }
  }
}
