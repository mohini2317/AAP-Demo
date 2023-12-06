# Define the number of days, hours, and minutes
$days = 3
$hours = 2
$minutes = 30

# Calculate the target date and time
$targetDateTime = (Get-Date).AddDays($days).AddHours($hours).AddMinutes($minutes)

# Format the target date and time as 'DD:HH:mm'
$targetDateTimeFormatted = '{0:D2}:{1:D2}:{2:D2}' -f $targetDateTime.Days, $targetDateTime.Hours, $targetDateTime.Minutes

# Define the trigger for the task (specific date and time)
$trigger = New-ScheduledTaskTrigger -Once -At $targetDateTimeFormatted


# Define parameters
$TaskName = "MyScheduledTask2"
$ScriptPath = "C:\Users\Administrator\Desktop\Get-SystemStatus.ps1"
$Action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-File $ScriptPath"
#$Trigger = New-ScheduledTaskTrigger -At "12:30" -Daily

# Create the task
Register-ScheduledTask -Action $Action -Trigger $Trigger -TaskName $TaskName -Description "Run My PowerShell Script"
