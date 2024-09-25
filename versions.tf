# Terraform version
terraform {
  required_version = ">=1.6.6"
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.112.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 2.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 2.0"
    }
  }
}