Add Printer Module
#Creator: Ross Halford
#Date: 01/07/2016
#Status: Beta

#Working Body
Function Add-Printer
{
    Param(
        [Parameter(Mandatory=$true)]
        [string]$servername,
        [Parameter(Mandatory=$true)]
        [string]$printername
    )
    Write-Host "Checking " $printername
        if (Test-Connection -ComputerName $printername -Count 1 -quiet)
        {
            (New-Object -ComObject WScript.Network).AddWindowsPrinterConnection("\\$servername\$printername")
        }
        else
        {
            Write-Output "$printername Not Online"
        }
}

Add-Printer
