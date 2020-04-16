$ErrorActionPreference = 'Stop'

$Aria2Home = "$env:USERPROFILE\.config\aria2"
$Aria2c = "$Aria2Home\aria2c.exe"
$Aria2Config = "$Aria2Home\aria2.conf"
$Aria2Session = "$Aria2Home\aria2.session"
$AutoStart = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\aria2.vbs"
$DownloadDir = "$env:USERPROFILE\Downloads"

# Cleanup
Get-Process 'aria2c' -ErrorAction SilentlyContinue | Stop-Process
Remove-Item $Aria2Home -Recurse -Force -ErrorAction SilentlyContinue
New-Item $Aria2Home -ItemType Directory | Out-Null

# Download
$arch = (32, 64)[[IntPtr]::Size -eq 8]
(New-Object Net.WebClient).DownloadFile("https://xing2000.coding.net/p/blog/d/static/git/raw/master/aria2c-${arch}bit.exe", $Aria2c)

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

Start-Process 'http://aria2.net'
