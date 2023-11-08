$Aria2Home = "$env:USERPROFILE\.config\aria2"
$AutoStart = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\aria2.vbs"

# Remove
Get-Process 'aria2c' | Stop-Process
Start-Sleep 1
Remove-Item $Aria2Home -Recurse -Force
Remove-Item $AutoStart -Force
