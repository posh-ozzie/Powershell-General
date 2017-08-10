#Remove-OldProfile
#Creator: Ross Halford
#Created: 10-08-2017
#Purpose: Remove user profiles older than a certain date
#Requirements: Powershell v3 or newer on the target computer.

#Variables
$profiles = Get-CimInstance win32_userprofile
$d = 30

#Function
function Remove-OldProfile
{
  foreach($p in $profiles)
  {
    #Dont want to delete profiles with Special set to true
    if($p.special -eq $true)
    {
        Write-Host "Skipping "$p.LocalPath " because it is a special system account.";
        Continue;
    }
    if($p.LocalPath -eq "c:\user\administrator")
    {
      Write-Host "Skipping "$p.LocalPath " because it is the local admin account.";
      Continue;
    }
    else
    {
        if($p.LastUseTime -gt (get-date).AddDays(-$d))
           {
                #Keeping the profile
                write-host $p.LocalPath " not old enough to remove"
            }
            else
            {
                #Profile can go
                write-host $p.LocalPath " is older than $d days old, deleting profile"
                Remove-CimInstance $p
            }
    }
  }
}

Remove-OldProfile 
