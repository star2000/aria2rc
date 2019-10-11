#Requires -Version 3

class Aria2 {
    $path = "$env:USERPROFILE\.config\aria2"
    $auto = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\aria2.vbs"
    $arch = (32, 64)[[System.IntPtr]::Size -eq 8]

    Cleanup() {
        Get-Process 'aria2c' -ErrorAction Ignore | Stop-Process
        Remove-Item $this.auto -Force
        Remove-Item $this.path -Recurse -Force
        New-Item $this.path -ItemType Directory
    }

    Install() {
        $url = Invoke-WebRequest 'api.github.com/repos/aria2/aria2/releases/latest' -UseBasicParsing -ErrorAction Stop | `
                ConvertFrom-Json | `
                Select-Object -ExpandProperty assets | `
                Where-Object { $_.name -like "*win-$($this.arch)*" } | `
                Select-Object -ExpandProperty browser_download_url
        Invoke-WebRequest $url -UseBasicParsing -OutFile "$env:TMP\aria2.zip" -ErrorAction Stop
        Expand-Archive "$env:TMP\aria2.zip" $env:TMP
        Copy-Item "$env:TMP\aria2*\aria2c.exe" $this.path
        Remove-Item "$env:TMP\aria2*" -Recurse -Force
    }

    Config() {
        New-Item "$($this.path)\aria2.conf" -Value @"
dir=$env:USERPROFILE\Downloads
input-file=$($this.path)\aria2.session
max-concurrent-downloads=10
continue=true

max-connection-per-server=16
min-split-size=1M
split=1024

enable-rpc=true
rpc-allow-origin-all=true

disk-cache=32M
file-allocation=falloc
save-session=$($this.path)\aria2.session
"@
        New-Item "$($this.path)\aria2.session"
    }

    Startup() {
        New-Item $this.auto -Value "CreateObject(`"WScript.Shell`").Run `"$($this.path)\aria2c.exe`",0"
        cscript.exe $this.auto
    }
}

$aria2 = [Aria2]::new()

$aria2.Cleanup()
$aria2.Install()
$aria2.Config()
$aria2.Startup()
