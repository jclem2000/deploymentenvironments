# web-app-scripting

## Overview

This folder contains a Terraform template to deploy a simple Azure Web App. The template also contains local_exec references to Pre and Post deployment scripts.

## Pre and Post Deployment Scripts

These are bin/sh scripts that are executed locally on the ADE runner compute resource. They are executed before and after the Terraform resource or data deployments. The scripts are used to perform tasks that are not supported by Terraform. For example, the scripts can be used to perform tasks such as creating a database, or running a database migration.

- [pre-deployment.sh](./pre-deployment.sh)
- [post-deployment.sh](./post-deployment.sh)

## Resource Deployment in Terraform

Terraform template [web_app_script.tf](./web_app_script.tf)

This template provides a simple Terraform configuration to deploy an Azure Web App via a Azure App Services Plan and a Windows Web App. Descriptions of the resources can be found here, from the 'azurerm' provider for Terraform:

[App Service Plan](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service)

[Windows Web App](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_web_app)

## Azure Deployment Environments manifest

This yaml file provides ADE with the information to perform the deployment.  

[manifest.yaml](./manifest.yaml)

## Additional Resources

For insight on how to utilize this template and deploy an environment for ADE, please see [Create an Environment](https://learn.microsoft.com/en-us/azure/deployment-environments/quickstart-create-access-environments)
