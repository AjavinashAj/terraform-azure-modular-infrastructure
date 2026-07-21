# Azure Modular Infrastructure using Terraform

## Project Overview

This project demonstrates the deployment of Azure infrastructure using Terraform with a modular Infrastructure as Code (IaC) approach.

The infrastructure has been divided into reusable Terraform modules to improve code reusability, maintainability, and scalability across different environments.

## Azure Resources Provisioned

The project provisions the following Azure resources:

- Resource Group
- Virtual Network (VNet)
- Subnet
- Public IP Address
- Network Interface (NIC)
- Linux Virtual Machine

## Project Structure

terraform-azure-modular-infrastructure/
│
├── environment/
│   ├── dev/
│   │   ├── main.tf
│   │   ├── provider.tf
│   │   └── variable.tf
│   │
│   └── prod/
│       ├── main.tf
│       ├── provider.tf
│       └── variable.tf
│
├── module/
│   ├── azure_resource_group/
│   ├── azure_virtual_network/
│   ├── azure_subnet/
│   ├── azure_public_ip/
│   ├── azure_data_block/
│   └── azure_Virtual_machine/
│
└── .gitignore

## Terraform Concepts Used

- Terraform Modules
- Variables
- tfvars
- for_each
- Data Sources
- Module Dependencies
- AzureRM Provider
- Infrastructure as Code (IaC)
- Multiple Environment Structure

## Prerequisites

Before deploying this infrastructure, make sure you have:

- Terraform installed
- Azure CLI installed
- An active Microsoft Azure subscription
- Azure CLI authenticated

Login to Azure:

```bash
az login

Deployment Steps
1. Initialize Terraform
terraform init
2. Validate Terraform Configuration
terraform validate
3. Review the Execution Plan
terraform plan
4. Deploy the Infrastructure
terraform apply
5. Destroy the Infrastructure
terraform destroy

Deployment Result

The Terraform deployment was completed successfully.

Resources: 6 added, 0 changed, 0 destroyed.

Technologies Used
Microsoft Azure
Terraform
AzureRM Provider
Azure CLI
Git
GitHub
Security

Sensitive Terraform files are excluded from version control using .gitignore, including:

terraform.tfstate
terraform.tfstate.backup
terraform.tfvars
.terraform/
Author

Avinash Kumar

Aspiring DevOps Engineer | Azure | Terraform | Linux | Git & GitHub
