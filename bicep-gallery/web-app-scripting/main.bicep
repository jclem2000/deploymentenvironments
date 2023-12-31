param resource_name string
param location string = resourceGroup().location
param utcValue string = utcNow()


resource pre_script 'Microsoft.Resources/deploymentScripts@2019-10-01-preview' = {
  name: 'pre_script'
  location: location
  kind: 'AzureCLI'
  identity: {
    type: 'UserAssigned'
    userAssignedIdentities: {
      '<your user assigned managed identity>': {}
    }
  }
  properties: {
    azCliVersion: '2.9.1'
    scriptContent: loadTextContent('pre-deployment.sh')
    arguments: ''
    retentionInterval: 'P1D'
    cleanupPreference: 'OnSuccess'
    forceUpdateTag: utcValue
  }
}

resource app_svc_plan 'Microsoft.Web/serverfarms@2019-08-01' = {
  name: '${resource_name}-app-svc-plan'
  location: location
  kind: 'app'
  sku: {
    name: 'F1'
  }
  properties: { }
  dependsOn: [ pre_script ]
}

resource windows_web_app 'Microsoft.Web/sites@2019-08-01' = {
  name: '${resource_name}-web-app'
  location: location
  kind: 'app'
  properties: {
    serverFarmId: app_svc_plan.id
    siteConfig: {}
  }
  dependsOn: [ pre_script ]
}

resource post_script 'Microsoft.Resources/deploymentScripts@2019-10-01-preview' = {
  name: 'post_script'
  location: location
  kind: 'AzureCLI'
  identity: {
    type: 'UserAssigned'
    userAssignedIdentities: {
      '<your user assigned managed identity>': {}
    }
  }
  properties: {
    azCliVersion: '2.9.1'
    scriptContent: loadTextContent('post-deployment.sh')
    arguments: ''
    retentionInterval: 'P1D'
    cleanupPreference: 'OnSuccess'
    forceUpdateTag: utcValue
  }
  dependsOn: [ windows_web_app ]
}
