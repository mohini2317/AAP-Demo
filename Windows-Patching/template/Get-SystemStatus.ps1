# Get system information
$hostname = $env:COMPUTERNAME
$osInfo = Get-CimInstance Win32_OperatingSystem
$cpuInfo = Get-CimInstance Win32_Processor
$memoryInfo = Get-CimInstance Win32_PhysicalMemory
$diskInfo = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID = 'C:'"

# Display system information
Write-Host "System Status Report"
Write-Host "---------------------"
Write-Host "Hostname: $hostname"
Write-Host "Operating System: $($osInfo.Caption) $($osInfo.Version)"
Write-Host "Processor: $($cpuInfo.Name)"
Write-Host "Memory: $($memoryInfo.Capacity / 1GB) GB"
Write-Host "Free Disk Space (C:): $($diskInfo.FreeSpace / 1GB) GB"
Write-Host "---------------------"

# Add more checks as needed...