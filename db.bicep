param loc string = resourceGroup().location
param dbName string = 'mstsqlServer'

resource mstsqlServer 'Microsoft.Sql/servers@2015-05-01-preview' = {
  
  name: dbName
  location: loc
  tags: {
    displayName: dbName
  }
  properties: {
    administratorLogin: 'mstiller'
    administratorLoginPassword: 'P@$$w0rd'
  }
}

resource mstsqlServer_AllowAllWindowsAzureIps 'Microsoft.Sql/servers/firewallRules@2015-05-01-preview' = {
  parent: mstsqlServer
  name: 'AllowAllWindowsAzureIps'
  properties: {
    startIpAddress: '0.0.0.0'
    endIpAddress: '0.0.0.0'
  }
}