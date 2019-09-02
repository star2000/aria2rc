$aria2 = "$HOME\.config\aria2"
$arch = if ([IntPtr]::Size -eq 8) { '64' } else { '32' }

Get-Process aria2c -ErrorAction Ignore | Stop-Process
Remove-Item "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\aria2.vbs" -Force | Out-Null
Remove-Item $aria2 -Recurse -Force | Out-Null
New-Item $aria2 -ItemType Directory | Out-Null

$url = Invoke-WebRequest api.github.com/repos/aria2/aria2/releases/latest -UseBasicParsing | ConvertFrom-Json | Select-Object -ExpandProperty assets | Where-Object { $_.name -like "*win-$arch*" } | Select-Object -ExpandProperty browser_download_url
Invoke-WebRequest $url -UseBasicParsing -OutFile "$env:TMP\aria2.zip"
Expand-Archive "$env:TMP\aria2.zip" "$env:TMP\aria2"
Get-ChildItem "$env:TMP\aria2\*\aria2c.exe" | Select-Object -ExpandProperty FullName | Copy-Item -Destination $aria2
Remove-Item "$env:TMP\aria2*" -Recurse -Force

New-Item "$aria2\aria2.conf" -Value @"
dir=$HOME\Downloads
input-file=$aria2\aria2.session
log=$aria2\aria2.log
max-concurrent-downloads=10
continue=true

max-connection-per-server=16
min-split-size=1M
split=1024

enable-rpc=true
rpc-allow-origin-all=true

disk-cache=32M
file-allocation=falloc
save-session=$aria2\aria2.session
save-session-interval=60
"@ | Out-Null
New-Item "$aria2\aria2.session" | Out-Null

New-Item "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\aria2.vbs" -Value "CreateObject(`"WScript.Shell`").Run `"$aria2\aria2c.exe`",0" | Out-Null
cscript.exe "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\aria2.vbs" | Out-Null
