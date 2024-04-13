terraform {
  required_providers {
    sdwan = {
      source = "CiscoDevNet/sdwan"
      version = ">= 0.3.7"
    }
  }
}

variable "MANAGER_ADDR" { type = string }
variable "MANAGER_PASS" { type = string }
variable "MANAGER_USER" { type = string }

provider "sdwan" {
  url      = var.MANAGER_ADDR
  username = var.MANAGER_USER
  password = var.MANAGER_PASS
}
