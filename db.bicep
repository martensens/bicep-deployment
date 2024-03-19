param loc string = resourceGroup().location
param dbName string = 'mstisqldatabase02'

resource mstisqlserver02 'Microsoft.Sql/servers@2015-05-01-preview' = {
  
  name: 'mstisqlserver02'
  location: loc
  tags: {
    displayName: dbName
  }
  properties: {
    administratorLogin: 'mstiller'
    administratorLoginPassword: 'Habenichts_01'
  }
}

resource mstisqlserver02_AllowAllWindowsAzureIps 'Microsoft.Sql/servers/firewallRules@2015-05-01-preview' = {
  parent: mstisqlserver02
  name: 'AllowAllWindowsAzureIps'
  properties: {
    startIpAddress: '0.0.0.0'
    endIpAddress: '0.0.0.0'
  }
}
