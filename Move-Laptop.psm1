#Move-Laptop
#Created: 22-06-2017
#Creator: Ross Halford
#
#Relocates laptop into correct OU and adds to Security Group in AD

function Move-Laptop {
    Param(
        [Parameter(Mandatory=$true)]
        [string]$computer
    )
    Get-ADComputer $computer | Move-ADObject -TargetPath 'Enter Target OU' -Confirm
    ADD-ADGroupMember -id WACHS-SW-COMPUTERS -members (Get-ADComputer -Identity $computer)
}

Move-Laptop