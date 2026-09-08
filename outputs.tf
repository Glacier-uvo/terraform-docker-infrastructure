output "network_name" {
  description = "Docker network used by the application"
  value       = docker_network.app_network.name
}

output "mongodb_container_name" {
  description = "MongoDB container name"
  value       = docker_container.mongodb_container.name
}

output "notes_api_container_name" {
  description = "Notes API container name"
  value       = docker_container.notes_api_container.name
}

output "notes_api_url" {
  description = "URL for accessing the Notes API"
  value       = "http://localhost:${var.notes_api_port}"
}