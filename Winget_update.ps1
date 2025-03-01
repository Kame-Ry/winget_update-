# Define log file location
$LogFile = "$env:USERPROFILE\winget_update_log.txt"

# Function to write log entries
Function Write-Log {
    param ([string]$Message)
    $TimeStamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    "$TimeStamp - $Message" | Out-File -Append -FilePath $LogFile
}

# Start logging
Write-Log "----- Starting Winget Updates -----"

# Check available updates
Write-Log "Checking for available updates..."
$updates = winget upgrade

if ($updates -match "No installed package found") {
    Write-Log "No updates available."
} else {
    Write-Log "Updates available:`n$updates"
}

# Run updates and log results
Write-Log "Running updates..."
$updateResults = winget upgrade -h --all 2>&1

# Log output
Write-Log "Update results:"
$updateResults | ForEach-Object { Write-Log $_ }

# Check for failures
if ($updateResults -match "Error|Failed") {
    Write-Log "Some updates failed. Review the log for details."
} else {
    Write-Log "All updates completed successfully."
}

Write-Log "----- Winget Updates Finished -----"
