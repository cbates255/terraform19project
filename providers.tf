terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "2.22.0"
    }
    aws = {
      source = "hashicorp/aws"
      version = "4.34.0"
    }
  }
}



provider "aws" {
    region = "us-east-1"
}

provider "docker" {}