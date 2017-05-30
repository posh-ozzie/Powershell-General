#Testing and Gathering Network Information
#A few different commands I found and used in the PS console.

#IP Information
Get-NetIPConfiguration #Similar to old ipconfig

#DNS Information
Get-DnsClientServerAddress #Provides details on DNS Servers being used
Get-DnsClientCache #Provides DNS Cache Information

#Map Network Drive
New-SmbMapping -LocalPath S: -RemotePath \\ServerName\Folders

#Test Remote Connection -P$
Test-Connection 8.8.8.8

#TraceRoute - P$
Test-Connection 8.8.8.8 -TraceRoute

#Test by Port
Test-Connection -CommonTCPPort HTTP -ComputerName google.com.au