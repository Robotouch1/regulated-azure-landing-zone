targetScope = 'subscription'

@description('Allowed Azure regions for regulated baseline.')
param allowedLocations array = [
  'eastus'
  'eastus2'
]

@description('Required tags for governance.')
param requiredTagNames array = [
  'owner'
  'environment'
  'dataClassification'
]

@description('Name of the baseline initiative assignment.')
param assignmentName string = 'asgn-regulated-baseline'

@description('Resource ID of the policy set (initiative) once created in the subscription.')
param policySetDefinitionId string

resource assignment 'Microsoft.Authorization/policyAssignments@2022-06-01' = {
  name: assignmentName
  properties: {
    displayName: 'Regulated Baseline - Core Guardrails'
    policyDefinitionId: policySetDefinitionId
    parameters: {
      allowedLocations: { value: allowedLocations }
      requiredTagNames: { value: requiredTagNames }
    }
    enforcementMode: 'Default'
  }
}
