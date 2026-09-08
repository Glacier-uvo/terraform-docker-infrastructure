variable "network_name" {
  description = "Name of the Docker network"
  type        = string
  default     = "notes_network"
}

variable "mongodb_container_name" {
  description = "Name of the Mongodb container"
  type        = string
  default     = "mongodb"
}

variable "notes_api_container_name" {
  description = "Name of the notesapi container"
  type        = string
  default     = "notes-api"
}

variable "notes_api_port" {
  description = "Port exposed by Notes API"
  type        = number
  default     = 3000
}