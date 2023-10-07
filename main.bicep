@maxLength(11)
param storageAccountPrefix string = 'bicep'
param loc string = resourceGroup().location

var sta = '${storageAccountPrefix}${uniqueString(subscription().id)}'

recource storageaccount 'Microsoft.Storage/storageAccounts@2023-10-06' = {
    name: sta
    location: loc
    kind: 'StorageV2'
    sku: {
        name: 'Standard_LRS'
    }
}
