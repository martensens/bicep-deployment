param loc string = resourceGroup().location
param dbName string = 'mstsqlServer'

resource mstsqlServer1 'Microsoft.Sql/servers@2015-05-01-preview' = {
  
  name: 'mstsqlServer1'
  location: loc
  tags: {
    displayName: dbName
  }
  properties: {
    administratorLogin: 'mstiller'
    administratorLoginPassword: 'P@$$w0rd'
  }
}

resource mstsqlServer1_AllowAllWindowsAzureIps 'Microsoft.Sql/servers/firewallRules@2015-05-01-preview' = {
  parent: mstsqlServer1
  name: 'AllowAllWindowsAzureIps'
  properties: {
    startIpAddress: '0.0.0.0'
    endIpAddress: '0.0.0.0'
  }
}