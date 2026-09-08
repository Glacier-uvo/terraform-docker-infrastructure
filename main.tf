terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

resource "docker_network" "app_network" {
  name = "var.network_name"
}

resource "docker_image" "mongodb" {
  name = "mongo:latest"
}

resource "docker_container" "mongodb_container" {
  name  = "var.mongodb_container_name"
  image = docker_image.mongodb.image_id

  networks_advanced {
    name = docker_network.app_network.name
  }
}

resource "docker_image" "notes_api" {
  name = "notes-api:latest"

  build {
    context    = "../project"
    dockerfile = "../project/Dockerfile"
    builder    = "terraform-builder"
  }
}

resource "docker_container" "notes_api_container" {
  name  = "var.notes_api_container_name"
  image = docker_image.notes_api.image_id

  networks_advanced {
    name = docker_network.app_network.name
  }
  ports {
    internal = var.notes_api_port
    external = var.notes_api_port
  }

  env = [
    "NOTES_MONGODB=mongodb://mongodb:27017/notes-api"
  ]
}


    