@description('Azure region to deploy into')
param location string = resourceGroup().location

@description('Log Analytics workspace ID')
param workspaceId string

var workspaceName = last(split(workspaceId, '/'))

resource solution 'Microsoft.OperationsManagement/solutions@2015-11-01-preview' = {
  name: 'LogicAppsManagement(${workspaceName})'
  location: location
  plan: {
    name: 'LogicAppsManagement(${workspaceName})'
    product: 'OMSGallery/LogicAppsManagement'
    promotionCode: ''
    publisher: 'Microsoft'
  }
  properties: {
    workspaceResourceId: workspaceId
    containedResources: [
      '${workspaceId}/views/LogicAppsManagement(${workspaceName})'
    ]
  }
}
