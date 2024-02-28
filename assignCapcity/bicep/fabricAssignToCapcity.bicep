param logicAppName string
param location string
param workspaceId string
param capacityId string

var managementUrl = 'https://api.fabric.microsoft.com/'

resource r_LogicApp 'Microsoft.Logic/workflows@2017-07-01' = {
  name: logicAppName
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    state: 'Enabled'
    definition: {
      // Definition schema and parameters as before, adjusted for the new action
      actions: {
        AssignToCapacityHTTP: {
          runAfter: {}
          type: 'Http'
          inputs: {
            authentication: {
              audience: managementUrl
              type: 'ManagedServiceIdentity'
            }
            method: 'POST'
            uri: '${managementUrl}/v1/workspaces/${workspaceId}/assignToCapacity'
            body: {
              capacityId: capacityId
            }
            headers: {
              'Content-Type': 'application/json'
            }
          }
        }
      }
    }
  }
}
