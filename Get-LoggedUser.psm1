#Find logged in user of remote computer
#v1.0 Runs solely in the PowerShell console.
#v1.1 Intergrated pop out windows.
#v1.2 Changed to module

Function Get-LoggedUser
{
    Param(
        [Parameter(Mandatory=$true)]
        [string]$computer
    )
    Write-Host "Checking " $computer
        if (Test-Connection -ComputerName $computer -Count 1 -quiet) {
            Get-WmiObject win32_computersystem -comp $computer | select Username,Caption,Manufacturer | Out-File 'C:\Temp\UserCheck.log' -append
        } else {
            write-host "$computer is offline"
        }
    
}

Get-LoggedUser