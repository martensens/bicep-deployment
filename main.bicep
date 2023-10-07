@maxLength(20)
param storageAccountPrefix string = 'bicep'
param loc string = resourceGroup().location

var sta = '${storageAccountPrefix}${uniqueString(subscription().id)}'

resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
    name: sta
    location: loc
    kind: 'StorageV2'
    sku: {
        name: 'Standard_LRS'
    }
}
