$ErrorActionPreference = 'Stop'

$Aria2Home = "$env:USERPROFILE\.config\aria2"
$Aria2c = "$Aria2Home\aria2c.exe"
$Aria2Config = "$Aria2Home\aria2.conf"
$Aria2Session = "$Aria2Home\aria2.session"
$AutoStart = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\aria2.vbs"
$DownloadDir = "$env:USERPROFILE\Downloads"

# Cleanup
Get-Process 'aria2c' -ErrorAction Ignore | Stop-Process
Remove-Item $Aria2Home -Recurse -Force -ErrorAction Ignore
New-Item $Aria2Home -ItemType Directory | Out-Null

# Download
$arch = (32, 64)[[IntPtr]::Size -eq 8]
(New-Object Net.WebClient).DownloadFile("http://cdn.jsdelivr.net/gh/star2000/aria2rc/aria2c.exe.${arch}bit", $Aria2c)

# Config
@"
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
"@ > $Aria2Config
'' > $Aria2Session

# Startup
@'
CreateObject("WScript.Shell").Run "powershell -NoProfile -NonInteractive "cd ~;.\.config\aria2\aria2c.ex"", 0
'@ > $AutoStart
wscript.exe $AutoStart

Start-Process 'http://aria2.net'
