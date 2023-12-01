# Define parameters
$TaskName = "MyScheduledTask"
$ScriptPath = "C:\Users\Administrator\Desktop\Get-SystemStatus.ps1"
$Action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-File $ScriptPath"
$Trigger = New-ScheduledTaskTrigger -At "17:30" -Daily

# Create the task
Register-ScheduledTask -Action $Action -Trigger $Trigger -TaskName $TaskName -Description "Run My PowerShell Script"
