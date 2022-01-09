terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.91.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {

  }
}

# Create a resource group
resource "azurerm_resource_group" "rg_TFtest" {
  name     = "rgAzureDevOpsDemo"
  location = "East US"
}

# Create a container group
resource "azurerm_container_group" "tfCg_demo" {
  name                = "weatherapi"
  location            = azurerm_resource_group.rg_TFtest.location
  resource_group_name = azurerm_resource_group.rg_TFtest.name

  ip_address_type = "public"
  dns_name_label  = "prashhome"
  os_type         = "linux"

  container {
    name   = "weatherapi"
    image  = "prashhome/weatherapi"
    cpu    = "1"
    memory = "1"

    ports {
      port     = "80"
      protocol = "TCP"
    }

  }

}