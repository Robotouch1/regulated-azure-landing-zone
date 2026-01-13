targetScope = 'subscription'

@description('Location for shared resources (logging, etc.).')
param location string = 'eastus'

@description('Name of the Log Analytics workspace for centralized security logging.')
param lawName string = 'law-central-security'

resource law 'Microsoft.OperationalInsights/workspaces@2023-09-01' = {
  name: lawName
  location: location
  properties: {
    retentionInDays: 180
    features: {
      enableLogAccessUsingOnlyResourcePermissions: true
    }
  }
}

output logAnalyticsWorkspaceId string = law.id
