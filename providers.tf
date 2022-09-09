terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~>2.20.2"


    }
  }
  backend "local" {
    path = "/home/constantine/weatherapp/terraform.tfstate"
  }
}

provider "docker" {}