# deploymentenvironments

Azure Deployment Environments (ADE) is a service that enables you to create and manage multiple environments for your Azure resources. You can use ADE to create environments for your dev, test, and production workloads. ADE provides a single pane of glass to manage your environments, and provides a consistent deployment experience across Azure services.

This repository contains various resources related to ADE.
Post deployment scripts.

## terraform-gallery

This folder contains Terraform templates to deploy Azure services. The templates are organized by Azure service. Each folder contains a Terraform template to deploy a specific Azure service. The templates also contain local_exec references to Pre and Post deployment scripts.

The terraform-gallery path can be integrated into your DevCenter Catalogs. For more information, see [Add a Catalog](https://learn.microsoft.com/en-us/azure/deployment-environments/quickstart-create-and-configure-devcenter#add-a-catalog-to-the-dev-center).
