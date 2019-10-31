aria2=$(wget -qO- raw.githubusercontent.com/ScoopInstaller/Main/master/bucket/aria2.json | jq '.architecture')

tmp='/tmp/aria2.zip'

for arch in 32bit 64bit; do
    wget -qO $tmp $(echo $aria2 | jq -r ".\"$arch\".url")
    unzip $tmp '*/aria2c.exe' -d '/tmp'
    rm $tmp
    mv /tmp/aria2*/aria2c.exe "aria2c.exe.$arch"
done
