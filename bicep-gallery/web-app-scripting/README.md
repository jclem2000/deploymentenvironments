# web-app-scripting

## Overview

This folder contains an ARM template to deploy a simple Azure Web App. The template also contains embedded instances of Deployment Scripts.  The ARM template is constructed from a Bicep template.  The Bicep template is compiled to ARM template using the Bicep CLI.  This process embeds the scripts into the ARM template as variables.

## Deployment Scripts

Azure Deployment Scripts are a resource that are defined using ARM templates.

[Deployment Scripts](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/deployment-script-template?tabs=azure-powershell)

Azure Deployment Scripts crafted in Bicep.

[Deployment Scripts in Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/deployment-script-bicep)

These scripts that are executed within a container instance in Azure. They are executed before and after the ARM resource or data deployments. The scripts are used to perform tasks that are not supported by Bicep or ARM. For example, the scripts can be used to perform tasks such as creating a database, or running a database migration.

## Resource Deployment of ARM Template

ARM template [main.json](./main.json)

```text
Note:  The references to a Storage Account name and User Assigned Managed Identity must be updated to reflect your environment.
```

Bicep template [main.bicep](./main.bicep)

```text
Note:  The references to User Assigned Managed Identity must be updated to reflect your environment.
```

The Bicep template references two scripts:

[pre-deployment.sh](./pre-deployment.sh)

[post-deployment.sh](./post-deployment.sh)

```text
Note:  The references to a Storage Account name must be updated to reflect your environment.
```

This template provides a simple Bicep/ARM configuration to deploy an Azure Web App via a Azure App Services Plan and a Windows Web App. Descriptions of the resources can be found here:

[App Service Plan](https://learn.microsoft.com/en-us/azure/templates/microsoft.web/serverfarms?pivots=deployment-language-bicep)

[Windows Web App](https://learn.microsoft.com/en-us/azure/templates/microsoft.web/sites?pivots=deployment-language-bicep)

## Azure Deployment Environments manifest

This yaml file provides ADE with the information to perform the deployment. The manifest references the main.json ARM template.

[manifest.yaml](./manifest.yaml)

## Additional Resources

For insight on how to utilize this template and deploy an environment for ADE, please see [Create an Environment](https://learn.microsoft.com/en-us/azure/deployment-environments/quickstart-create-access-environments)
