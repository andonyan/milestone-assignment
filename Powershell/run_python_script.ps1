$taskName = "Output system date and time to file"

$taskExists = Get-ScheduledTask | Where-Object {$_.TaskName -like $taskName }

if ($taskExists) {
    Unregister-ScheduledTask -TaskName $taskName -Confirm:$false
}

$action = New-ScheduledTaskAction -Execute "C:\Program Files\Python\Python.exe" -Argument "$PSScriptRoot\Python\system_time.py"

$trigger = New-ScheduledTaskTrigger -Once -At (Get-Date).AddSeconds(3)

$principal = New-ScheduledTaskPrincipal -UserID "NT AUTHORITY\SYSTEM" -LogonType ServiceAccount

$settings = New-ScheduledTaskSettingsSet -ExecutionTimeLimit (New-TimeSpan -Minutes 30)

Register-ScheduledTask -Action $action -Trigger $trigger -Principal $principal -Settings $settings -TaskName "Output system date and time to file" `
-Description "Triggers Python script that outputs the system time and date to a file every 5 seconds"
