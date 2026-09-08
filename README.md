# terraform-docker-infrastructure

\# Terraform Docker Infrastructure



Infrastructure as Code project using Terraform to provision and manage a containerized Notes API environment with Docker.



\## Overview



This project demonstrates how Terraform can be used to manage Docker infrastructure declaratively instead of creating containers and networks manually.



Terraform provisions:



\* A dedicated Docker network

\* A MongoDB container

\* A Notes API Docker image

\* A Notes API container

\* Container networking and configuration



The project uses Terraform to define the desired infrastructure state and verify that the actual Docker environment matches that configuration.



\## Architecture



&#x20;                   Docker Host

&#x20;                        │

&#x20;                 Terraform manages

&#x20;                        │

&#x20;                 ┌──────┴──────┐

&#x20;                 │             │

&#x20;           Docker Network      │

&#x20;                 │             │

&#x20;         ┌───────┴────────┐    │

&#x20;         │                │    │

&#x20;    Notes API          MongoDB │

&#x20;    Container          Container

&#x20;         │                │

&#x20;         └───────┬────────┘

&#x20;                 │

&#x20;            Application

&#x20;            communication



\## Technologies



\* Terraform

\* Docker

\* MongoDB

\* Node.js / Notes API

\* Git

\* GitHub



\## Terraform Resources



The infrastructure is defined in main.tf



Terraform manages the Docker resources required for the application, including the network, MongoDB container, Notes API image, and Notes API container.



\## Project Structure



terraformproject/

│

├── main.tf

├── .gitignore

├── .terraform.lock.hcl

└── README.md



Terraform state files and downloaded provider binaries are intentionally excluded from Git using .gitignore.



\## Prerequisites



Before running the project, install:



\* Docker Desktop

\* Terraform

\* Git



Docker must be running before Terraform can provision the infrastructure.



\## Getting Started



Clone the repository:



git clone https://github.com/Glacier-uvo/terraform-docker-infrastructure.git

cd terraform-docker-infrastructure



Initialize Terraform:



terraform init





Review the infrastructure plan:



terraform plan



Apply the configuration:



terraform apply





When prompted, enter:



yes



\## Verify the Infrastructure



Check the Terraform-managed resources:



terraform show





You can also inspect the running Docker containers:



docker ps



Check the Docker networks:



docker network ls





\## Terraform Workflow



The project follows the standard Terraform workflow:



Write configuration

&#x20;      ↓

terraform init

&#x20;      ↓

terraform plan

&#x20;      ↓

terraform apply

&#x20;      ↓

Infrastructure created

&#x20;      ↓

terraform plan

&#x20;      ↓

No changes





A successful `terraform plan` showing \*\*"No changes"\*\* confirms that the infrastructure matches the Terraform configuration.



\## What I Practiced



Through this project, I practiced:



\* Infrastructure as Code

\* Terraform configuration

\* Terraform providers

\* Docker resource management with Terraform

\* Container networking

\* Infrastructure provisioning

\* Terraform state management

\* Idempotent infrastructure changes

\* Git and GitHub version control

\* Troubleshooting Terraform and Docker configuration issues



\## Future Improvements



Potential next steps for this project include:



\* Add Terraform variables

\* Add Terraform outputs

\* Separate configuration into multiple `.tf` files

\* Add CI validation with GitHub Actions

\* Add automated Terraform formatting and validation

\* Deploy the infrastructure to a cloud environment



\## Author



\*\*Glacier-uvo\*\*



GitHub: https://github.com/Glacier-uvo



