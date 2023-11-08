$ErrorActionPreference = 'Stop'

$Aria2Home = "$env:USERPROFILE\.config\aria2"
$Aria2LastReleaseUrl = 'https://api.github.com/repos/aria2/aria2/releases/latest'
$Aria2Zip = "$Aria2Home\aria2.zip"
$Aria2UnZip = "$Aria2Home\aria2_unzip\"
$Aria2c = "$Aria2Home\aria2c.exe"
$Aria2Config = "$Aria2Home\aria2.conf"
$Aria2Session = "$Aria2Home\aria2.session"
$AutoStart = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\aria2.vbs"
$DownloadDir = "$env:USERPROFILE\Downloads"

# Cleanup
Get-Process 'aria2c' -ErrorAction SilentlyContinue | Stop-Process
Start-Sleep 1
Remove-Item $Aria2Home -Recurse -Force -ErrorAction SilentlyContinue
New-Item $Aria2Home -ItemType Directory | Out-Null

# Download
$LastRelease = Invoke-RestMethod $Aria2LastReleaseUrl
$arch = (32, 64)[[IntPtr]::Size -eq 8]
$asset = $LastRelease.assets | Where-Object { $_.name -match "win-${arch}.*\.zip$" }
Invoke-WebRequest -UseBasicParsing $asset.browser_download_url -OutFile $Aria2Zip
Expand-Archive $Aria2Zip $Aria2UnZip
Remove-Item $Aria2Zip -Force
Get-ChildItem $Aria2UnZip -Recurse | Where-Object { $_.Extension -eq '.exe' } | ForEach-Object { Move-Item $_.FullName $Aria2c -Force }
Remove-Item $Aria2UnZip -Recurse -Force -ErrorAction SilentlyContinue

# Config
New-Item $Aria2Config -ItemType File -Value @"
dir=$DownloadDir
input-file=$Aria2Session
max-concurrent-downloads=10
continue=true

max-connection-per-server=16
min-split-size=1M
split=1024

enable-rpc=true
rpc-allow-origin-all=true

disk-cache=32M
file-allocation=falloc
save-session=$Aria2Session
"@ | Out-Null
'' > $Aria2Session

# Startup
@"
CreateObject("WScript.Shell").Run "$Aria2c", 0
"@ > $AutoStart
wscript.exe $AutoStart

# Count
Invoke-WebRequest -UseBasicParsing 'https://fastly.jsdelivr.net/gh/star2000/count@4/count' -ErrorAction SilentlyContinue | Out-Null
