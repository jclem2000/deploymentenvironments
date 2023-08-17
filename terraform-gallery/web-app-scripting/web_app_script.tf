terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }

  required_version = ">= 1.0.0"
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

variable "resource_group_name" {}
variable "resource_name" {}
variable "location" {}

data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

resource "null_resource" "chmod" {
  triggers = {
    always_run = "${timestamp()}"
  }
  provisioner "local-exec" {
    command = "chmod +x *.sh"
  }
}

resource "null_resource" "prescript" {
  triggers = {
    always_run = "${timestamp()}"
  }
  provisioner "local-exec" {
    command = "./pre-deployment.sh"
  }
  depends_on = [null_resource.chmod]
}

resource "azurerm_service_plan" "service_plan" {
  name                = replace(var.resource_name, " ", "-")
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = var.location
  sku_name            = "P1v2"
  os_type             = "Windows"
  depends_on          = [null_resource.prescript]
}

resource "azurerm_windows_web_app" "example" {
  name                = replace(var.resource_name, " ", "-")
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = var.location
  service_plan_id     = azurerm_service_plan.service_plan.id
  site_config {}
  depends_on = [null_resource.prescript]
}

resource "null_resource" "postscript" {
  triggers = {
    always_run = "${timestamp()}"
  }
  provisioner "local-exec" {
    command = "./post-deployment.sh"
  }
  depends_on = [azurerm_windows_web_app.example, azurerm_service_plan.service_plan]
}
