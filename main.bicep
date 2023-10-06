@maxLength(11)
param storageAccountPrefix string = 'bicep'
param location string = resourceGroup().location

var sta = '${storageAccountPrefix}${uniqueString(subscription().id)}'

recource storageaccount 'Microsoft.Storage/storageAccounts@2023-10-06' = {
    name: sta
    location: location
    kind: 'StorageV2'
    sku: {
        name: 'Standard_LRS'
    }
}
