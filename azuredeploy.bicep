targetScope = 'subscription'

@description('Azure region to deploy into')
param location string = deployment().location

@description('Enable Microsoft Sentinel?')
param enableSentinel bool = true

@description('Workload name')
param workloadName string

resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: '${workloadName}-${location}'
  location: location
}

module workspace 'workspace.bicep' = {
  name: '${workloadName}-workspace-deployment'
  scope: resourceGroup
  params: {
    location: location
    workloadName: workloadName
  }
}

module sentinelSolution 'sentinel.bicep' = if (enableSentinel) {
  name: '${workloadName}-sentinel-solution-deployment'
  scope: resourceGroup
  params: {
    location: location
    workspaceId: workspace.outputs.workspaceId
  }
}

module logicAppsManagementSolution 'logicapps.bicep' = {
  name: '${workloadName}-logicappsmanagement-solution-deployment'
  scope: resourceGroup
  params: {
    location: location
    workspaceId: workspace.outputs.workspaceId
  }
}
