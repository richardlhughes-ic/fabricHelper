using 'fabricAssignToCapacity.bicep'

@description('Name of the logic app. Unique to the Resource Group. 1-43 Characters')
param logicAppName string = '<logic_app_name>'

@description('Azure Region that Logic App will be deployed to. Likely the same as selected Resource Group')
param location string = '<azure_region>'

@description('ID of the workspace that is being assigned to a capacity')
param workspaceId string = '<workspace_id>'

@description('ID of the capacity to which the workspace is being assigned')
param capacityId string = '<capacity_id>'
