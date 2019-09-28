aria2="$HOME/.aria2"
app="$HOME/.local/applications/aria2.desktop"
auto="$HOME/.config/autostart/aria2.desktop"

pkill aria2c
rm $app -f
rm $auto -f
rm $aria2 -rf
mkdir $aria2
mkdir "$HOME/.local/applications" 2>/dev/null
mkdir "$HOME/.config/autostart" 2>/dev/null

if ! which aria2c >/dev/null; then
    if which apt >/dev/null; then
        sudo apt install -y aria2
    elif which yum >/dev/null; then
        sudo yum install -y aria2
    fi
fi

echo "
dir=$(xdg-user-dir DOWNLOAD)
input-file=$aria2/aria2.session
max-concurrent-downloads=10
continue=true

max-connection-per-server=16
min-split-size=1M
split=1024

enable-rpc=true
rpc-allow-origin-all=true

disk-cache=32M
force-save=true
save-session=$aria2/aria2.session
" >"$aria2/aria2.conf"
touch "$aria2/aria2.session"

echo "
[Desktop Entry]
Name=aria2
Exec=aria2c
Type=Application
" >$app
ln -s $app $auto

gtk-launch aria2
