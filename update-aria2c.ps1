$aria2 = Invoke-WebRequest 'raw.githubusercontent.com/ScoopInstaller/Main/master/bucket/aria2.json' -UseBasicParsing | `
        ConvertFrom-Json | `
        Select-Object -ExpandProperty architecture

'32bit', '64bit' | ForEach-Object {
    Invoke-WebRequest $aria2.$_.url -UseBasicParsing -OutFile "$env:TMP\aria2.zip"
    Expand-Archive "$env:TMP\aria2.zip" $env:TMP
    Remove-Item "$env:TMP\aria2.zip" -Force
    Copy-Item "$env:TMP\$($aria2.$_.extract_dir)\aria2c.exe" "aria2c.exe.$_"
    Remove-Item "$env:TMP\$($aria2.$_.extract_dir)" -Recurse -Force
}
