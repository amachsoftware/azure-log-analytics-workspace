@description('Azure region to deploy into')
param location string = resourceGroup().location

@description('Workload name')
param workloadName string

resource workspace 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: '${workloadName}-workspace'
  location: location
  properties: {
    retentionInDays: 730
  }
}

output workspaceId string = workspace.id
