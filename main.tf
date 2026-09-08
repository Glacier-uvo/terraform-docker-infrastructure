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
  name = "notes_network"
}

resource "docker_image" "mongodb" {
  name = "mongo:latest"
}

resource "docker_container" "mongodb_container" {
  name  = "mongodb"
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
  name  = "notes-api"
  image = docker_image.notes_api.image_id

  networks_advanced {
    name = docker_network.app_network.name
  }
  ports {
    internal = 3000
    external = 3000
  }

  env = [
    "NOTES_MONGODB=mongodb://mongodb:27017/notes-api"
  ]
}


    