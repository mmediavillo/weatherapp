terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.20.1"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = "~>2.20.2"
    }
  }


}
# provider "aws" {
#   region = "us-east-1"
# }

provider "docker" {}
