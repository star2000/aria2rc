aria2="$HOME/.aria2"
app="$HOME/.local/applications/aria2.desktop"
auto="$HOME/.config/autostart/aria2.desktop"

pkill aria2c
rm $app -f
rm $auto -f
rm $aria2 -rf
mkdir $aria2
mkdir "$HOME/.local/applications"
mkdir "$HOME/.config/autostart"

if which apt >/dev/null; then
    sudo apt install -y aria2
elif which yum >/dev/null; then
    sudo yum install -y aria2
fi

tee "$aria2/aria2.conf" <<@
dir=$(xdg-user-dir DOWNLOAD)
input-file=$aria2/aria2.session
log=$aria2/aria2.log
max-concurrent-downloads=10
continue=true

max-connection-per-server=16
min-split-size=1M
split=1024

enable-rpc=true
rpc-allow-origin-all=true

disk-cache=32M
save-session=$aria2/aria2.session
save-session-interval=60
@
touch "$aria2/aria2.session"

tee $app <<@
[Desktop Entry]
Name=aria2
Exec=aria2c
Type=Application
@
ln -s $app $auto

gtk-launch aria2
