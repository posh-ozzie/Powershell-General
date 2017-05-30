# Hardware and OS Info Gathering

#Create file for data storage
$file = New-Item -ItemType file -Name Hardware-OS-info.txt

#Detailed Memory Information
Get-CimInstance Win32_Processor | Select Name, Caption | Format-Table -AutoSize | Out-File -FilePath $file #Outputs info regarding CPU
Get-CimInstance Win32_PhysicalMemory | Select Tag, BankLabel, @{n='Capacity MB';e={$_.capacity / 1MB -as [int]}} | Format-Table -AutoSize | Out-File -FilePath $file -append #Outputs detailed information regarding each memory module.

#Disk Drive Information
Get-WmiObject -class win32_logicaldisk | select DeviceID , @{n='Size GB';e={$_.size / 1gb -as [int]}}, @{n='Free Space';e={$_.freespace / 1gb -as [int]}} | Format-Table -AutoSize | Out-File -FilePath $file -append #Outputs details on all physical drives in the machine.

#BIOS Information
Get-CimInstance Win32_BIOS | Format-Table -AutoSize | Out-File -FilePath $file -append #the bios of the mainboard
Get-CimInstance Win32_BIOS | select Name, Version | Format-Table -AutoSize | Out-File -FilePath $file -append # Pulls an abbreviated set of data, showing selected details

#Logs
Get-EventLog -log system -newest 1000 | Where-Object eventid -eq '1074' | Format-Table machinename, username,timegenerated -autosize | Out-File -FilePath $file -append #Last set of users to log into the machien