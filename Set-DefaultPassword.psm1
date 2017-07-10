#Set-DefaultPassword
#Created: 10-07-2017
#Creator: Ross Halford
#Purpose: Quickly reset a users password to the company default.

#Variables
$password = Get-Content -Path "C:\Temp\Variable Files\Default.txt"

#Function
function Set-DefaultPassword
{
    Param(
        [Parameter(Mandatory=$true)]
        [string]$username
    )
    #Check Lockout

    #Check Enabled

    #Password Reset
    Set-ADAccountPassword -Identity $username -Reset -NewPassword (ConvertTo-SecureString -AsPlainText $password -Force)
    Set-ADuser -Identity $username -ChangePasswordAtLogon $True
}

Set-DefaultPassword