param loc string = resourceGroup().location
param serverName string = 'mstisqlserver02'
param dbName string = 'mstidatabase02'

resource serverename 'Microsoft.Sql/servers@2015-05-01-preview' = {
  
  name: serverName
  location: loc
  tags: {
    displayName: serverName
  }
  properties: {
    administratorLogin: 'mstiller'
    administratorLoginPassword: 'Habenichts_01'
  }
}

resource mstisqlserver02_AllowAllWindowsAzureIps 'Microsoft.Sql/servers/firewallRules@2015-05-01-preview' = {
  parent: serverename
  name: 'AllowAllWindowsAzureIps'
  properties: {
    startIpAddress: '0.0.0.0'
    endIpAddress: '0.0.0.0'
  }
}

resource dbname 'Microsoft.Sql/servers/databases@2023-08-01-preview' = {
  parent: serverename
  location: loc
  name: dbName
  tags: {
    displayname: dbName
  }
}
