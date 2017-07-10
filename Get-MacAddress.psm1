#Module: Get-MacAddress
#Created: 22-06-2017
#Creator: Ross Halford
#
#Purpose: Returns all MAC Address for network interfaces on target computer


function Get-MACAddress 
{ 
    Param(
        [Parameter(Mandatory=$true)]
        [string]$computer
    )
    Write-Host "Checking " $computer
        if (Test-Connection -ComputerName $computer -Count 1 -quiet) {
            get-wmiobject -class "Win32_NetworkAdapterConfiguration" -computername $computer | select Description,MACAddress 
        } else {
            write-host "$computer is offline"
        }
} 
 
Get-MACAddress
