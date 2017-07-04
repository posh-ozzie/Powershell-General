#Test-ComputerStatus
#Creator: Ross Halford
#Date: 04/07/2017
#Status: v1.0
#Info: Simple script made to be launched from a desktop shortcut.

[void][System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic')  
$ComputerName = [Microsoft.VisualBasic.Interaction]::InputBox("Enter Target Computer", "Name")

Test-Connection -ComputerName $ComputerName -Count 1 -quiet 
if (Test-Connection -ComputerName $ComputerName -Count 1 -quiet) {
    [System.Windows.Forms.MessageBox]::Show("Computer is Online.")
    }
Else
{
    [System.Windows.Forms.MessageBox]::Show("Computer is Offline, or Non-Existant.")
exit
} 